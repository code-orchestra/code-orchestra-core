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
package jetbrains.mps.util;

import difflib.DiffUtils;
import difflib.Patch;

import java.util.Arrays;
import java.util.List;

/**
 * @author Evgeny Gerashchenko
 * @since 4/6/11
 */
public class DifflibFacade {
  public static String[] getGenDiff(String[] old, String[] generated) {
    final String[] NO_DIFF = {"No diff"};
    if (old.length == 0 && generated.length == 0) {
      return NO_DIFF;
    }
    Patch diff = DiffUtils.diff(Arrays.asList(old), Arrays.asList(generated));
    if (diff.getDeltas().isEmpty()) {
      return NO_DIFF;
    }
    List<String> udiff = DiffUtils.generateUnifiedDiff("old text", "generated text", Arrays.asList(old), diff, 3);
    return udiff.toArray(new String[udiff.size()]);
  }

  public static String[] getSimpleDiff(String[] old, String[] new_) {
    String[] genDiff = getGenDiff(old, new_);
    if (genDiff.length <= 2) {
      return new String[0];
    } else {
      return Arrays.copyOfRange(genDiff, 2, genDiff.length);
    }
  }

  public static String[] getSimpleDiff(String old, String new_) {
    return getSimpleDiff(old.split("\n|\r\n"), new_.split("\n|\r\n"));
  }
}
