/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.intellij.ide.util.gotoByName.temp;

import com.intellij.ide.util.gotoByName.ChooseByNameModel;
import com.intellij.ide.util.gotoByName.ChooseByNamePopup;
import com.intellij.ide.util.gotoByName.CustomMatcherModel;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.util.Comparing;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.psi.PsiElement;
import com.intellij.psi.codeStyle.NameUtil;
import com.intellij.psi.codeStyle.NameUtil.Matcher;
import com.intellij.psi.util.proximity.PsiProximityComparator;
import com.intellij.util.Function;
import com.intellij.util.SmartList;
import com.intellij.util.containers.ContainerUtil;
import org.jetbrains.annotations.Nullable;

import java.lang.ref.WeakReference;
import java.util.*;

public class IdeaItemProvider implements ItemProvider {
  private static final Logger LOG = Logger.getInstance("#com.intellij.ide.util.gotoByName.ChooseByNameIdea");
  private ChooseByNameBase myBase;
  private WeakReference<PsiElement> myContext;

  public IdeaItemProvider(PsiElement context) {
    myContext = new WeakReference<PsiElement>(context);
  }

  public void setBase(ChooseByNameBase base) {
    myBase = base;
  }

  public List<Object> filterElements(String pattern, boolean everywhere, Computable<Boolean> cancelled, int maxListSize, String extra) {
    String namePattern = getNamePattern(pattern);
    String qualifierPattern = getQualifierPattern(pattern);

    if (myBase.isSearchInAnyPlace() && namePattern.trim().length() > 0) {
      namePattern = "*" + namePattern + "*";
    }

    boolean empty = namePattern.length() == 0 || namePattern.equals("@");    // TODO[yole]: remove implicit dependency
    if (empty && !myBase.canShowListForEmptyPattern()) return Collections.emptyList();

    List<String> namesList = new ArrayList<String>();
    getNamesByPattern(myBase.getNames(everywhere), cancelled, namesList, namePattern);
    if (cancelled.compute()) {
      throw new ProcessCanceledException();
    }
    // Here we sort using namePattern to have similar logic with empty qualified patten case
    Collections.sort(namesList, new MatchesComparator(namePattern));

    boolean overflow = false;
    List<Object> sameNameElements = new SmartList<Object>();
    ArrayList<Object> res = new ArrayList<Object>();

    All:
    for (String name : namesList) {
      if (cancelled.compute()) {
        throw new ProcessCanceledException();
      }
      final Object[] elements = myBase.getModel().getElementsByName(name, everywhere, namePattern);
      if (elements.length > 1) {
        sameNameElements.clear();
        for (final Object element : elements) {
          if (matchesQualifier(element, qualifierPattern)) {
            sameNameElements.add(element);
          }
        }
        sortByProximity(sameNameElements);
        for (Object element : sameNameElements) {
          res.add(element);
          if (res.size() >= maxListSize) {
            overflow = true;
            break All;
          }
        }
      } else if (elements.length == 1 && matchesQualifier(elements[0], qualifierPattern)) {
        res.add(elements[0]);
        if (res.size() >= maxListSize) {
          overflow = true;
          break;
        }
      }
    }

    if (overflow) {
      res.add(extra);
    }

    return res;
  }

  private void sortByProximity(final List<Object> sameNameElements) {
    Collections.sort(sameNameElements, new PathProximityComparator(myBase.getModel(), myContext.get()));
  }

  public String getQualifierPattern(String pattern) {
    final String[] separators = myBase.getModel().getSeparators();
    int lastSeparatorOccurence = 0;
    for (String separator : separators) {
      lastSeparatorOccurence = Math.max(lastSeparatorOccurence, pattern.lastIndexOf(separator));
    }
    return pattern.substring(0, lastSeparatorOccurence);
  }

  public String getNamePattern(String pattern) {
    pattern = myBase.transformPattern(pattern);

    ChooseByNameModel model = myBase.getModel();
    final String[] separators = model.getSeparators();
    int lastSeparatorOccurence = 0;
    for (String separator : separators) {
      final int idx = pattern.lastIndexOf(separator);
      lastSeparatorOccurence = Math.max(lastSeparatorOccurence, idx == -1 ? idx : idx + separator.length());
    }

    return pattern.substring(lastSeparatorOccurence);
  }

  private List<String> split(String s) {
    List<String> answer = new ArrayList<String>();
    for (String token : StringUtil.tokenize(s, StringUtil.join(myBase.getModel().getSeparators(), ""))) {
      if (token.length() > 0) {
        answer.add(token);
      }
    }

    return answer.isEmpty() ? Collections.singletonList(s) : answer;
  }

  private boolean matchesQualifier(final Object element, final String qualifierPattern) {
    final String name = myBase.getModel().getFullName(element);
    if (name == null) return false;

    final List<String> suspects = split(name);
    final List<Pair<String, Matcher>> patternsAndMatchers =
      ContainerUtil.map2List(split(qualifierPattern), new Function<String, Pair<String, Matcher>>() {
        public Pair<String, NameUtil.Matcher> fun(String s) {
          final String pattern = getNamePattern(s);
          final NameUtil.Matcher matcher = buildPatternMatcher(pattern);

          return new Pair<String, NameUtil.Matcher>(pattern, matcher);
        }
      });

    int matchPosition = 0;

    try {
      patterns:
      for (Pair<String, NameUtil.Matcher> patternAndMatcher : patternsAndMatchers) {
        final String pattern = patternAndMatcher.first;
        final NameUtil.Matcher matcher = patternAndMatcher.second;
        if (pattern.length() > 0) {
          for (int j = matchPosition; j < suspects.size() - 1; j++) {
            String suspect = suspects.get(j);
            if (matches(pattern, matcher, suspect)) {
              matchPosition = j + 1;
              continue patterns;
            }
          }

          return false;
        }
      }
    } catch (Exception e) {
      // Do nothing. No matches appears valid result for "bad" pattern
      return false;
    }

    return true;
  }

  public List<String> getNamesByPattern(String[] names, String pattern){
    ArrayList<String> res = new ArrayList<String>();
    getNamesByPattern(names,null, res, pattern);
    return res;
  }

  private void getNamesByPattern(String[] names,
                                 Computable<Boolean> cancelled,
                                 final List<String> list,
                                 String pattern) throws ProcessCanceledException {
    if (!myBase.canShowListForEmptyPattern()) {
      LOG.assertTrue(pattern.length() > 0);
    }

    if (pattern.startsWith("@")) {
      pattern = pattern.substring(1);
    }

    final NameUtil.Matcher matcher = buildPatternMatcher(pattern);

    try {
      for (String name : names) {
        if (cancelled != null && cancelled.compute()) {
          break;
        }
        if (matches(pattern, matcher, name)) {
          list.add(name);
        }
      }
    } catch (Exception e) {
      // Do nothing. No matches appears valid result for "bad" pattern
    }
  }

  private boolean matches(String pattern, NameUtil.Matcher matcher, String name) {
    boolean matches = false;
    if (name != null) {
      if (myBase.getModel() instanceof CustomMatcherModel) {
        if (((CustomMatcherModel) myBase.getModel()).matches(name, pattern)) {
          matches = true;
        }
      } else if (pattern.length() == 0 || matcher.matches(name)) {
        matches = true;
      }
    }
    return matches;
  }

  private NameUtil.Matcher buildPatternMatcher(String pattern) {
    return NameUtil.buildMatcher(pattern, 0, true, true, pattern.toLowerCase().equals(pattern));
  }

  private static class MatchesComparator implements Comparator<String> {
    private final String myOriginalPattern;

    private MatchesComparator(final String originalPattern) {
      myOriginalPattern = originalPattern.trim();
    }

    public int compare(final String a, final String b) {
      boolean aStarts = a.startsWith(myOriginalPattern);
      boolean bStarts = b.startsWith(myOriginalPattern);
      if (aStarts && bStarts) return a.compareToIgnoreCase(b);
      if (aStarts && !bStarts) return -1;
      if (bStarts && !aStarts) return 1;
      return a.compareToIgnoreCase(b);
    }
  }

  private static class PathProximityComparator implements Comparator<Object> {
    private final ChooseByNameModel myModel;
    private final PsiProximityComparator myProximityComparator;

    private PathProximityComparator(final ChooseByNameModel model, @Nullable final PsiElement context) {
      myModel = model;
      myProximityComparator = new PsiProximityComparator(context);
    }

    public int compare(final Object o1, final Object o2) {
      int rc = myProximityComparator.compare(o1, o2);
      if (rc != 0) return rc;

      return Comparing.compare(myModel.getFullName(o1), myModel.getFullName(o2));
    }
  }
}
