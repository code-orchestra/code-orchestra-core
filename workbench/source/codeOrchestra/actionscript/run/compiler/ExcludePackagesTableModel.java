package codeOrchestra.actionscript.run.compiler;

import codeOrchestra.actionscript.view.ASPackageTreeNode;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.misc.hash.HashMap;

import javax.swing.Icon;
import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ExcludePackagesTableModel extends AbstractTableModel {

  public static final int ICON_COLUMN_INDEX = 0;
  public static final int PACKAGE_COLUMN_INDEX = 1;
  public static final int INCLUDE_COLUMN_INDEX = 2;

  private List<String> excludedPackages;
  private List<String> allPackages;
  private Solution solution;

  public ExcludePackagesTableModel(List<String> excludedPackages, Solution solution) {
    this.excludedPackages = excludedPackages;
    this.solution = solution;
    initPackages();
  }

  private void initPackages() {
    this.allPackages = new ArrayList<String>();

    HashMap<Solution, Boolean> dependenciesMap = new HashMap<Solution, Boolean>();
    SolutionUtils.fetchDependencies(solution, dependenciesMap);

    for (Solution dependencySolution : dependenciesMap.keySet()) {
      Boolean isExcludedDependency = dependenciesMap.get(dependencySolution);
      if (!isExcludedDependency) {
        for (SModelDescriptor sModelDescriptor : dependencySolution.getOwnModelDescriptors()) {
          String packageName = sModelDescriptor.getLongName();
          if ("".equals(packageName)) {
            continue;
          }

          if (!allPackages.contains(packageName)) {
            allPackages.add(packageName);
          }
        }
      }
    }

    Collections.sort(allPackages);
  }

  public Class<?> getColumnClass(int columnIndex) {
    switch (columnIndex) {
      case ICON_COLUMN_INDEX:
        return Icon.class;
      case PACKAGE_COLUMN_INDEX:
        return String.class;
      case INCLUDE_COLUMN_INDEX:
        return Boolean.class;
      default:
        return null;
    }
  }

  @Override
  public String getColumnName(int column) {
    switch (column) {
      case ICON_COLUMN_INDEX:
        return "";
      case PACKAGE_COLUMN_INDEX:
        return "Package";
      case INCLUDE_COLUMN_INDEX:
        return "Include";
      default:
        return null;
    }
  }

  public Object getValueAt(int row, int column) {
    String packageName = allPackages.get(row);
    switch (column) {
      case ICON_COLUMN_INDEX:
        return ASPackageTreeNode.PACKAGE_ICON;
      case PACKAGE_COLUMN_INDEX:
        return packageName;
      case INCLUDE_COLUMN_INDEX:
        return !excludedPackages.contains(packageName);
      default:
        return null;
    }
  }

  public void setValueAt(Object value, int row, int column) {
    switch (column) {
      case INCLUDE_COLUMN_INDEX:
        String packageName = allPackages.get(row);

        Boolean include = (Boolean) value;
        if (include) {
          excludedPackages.remove(packageName);
        } else {
          if (!excludedPackages.contains(packageName)) {
            excludedPackages.add(packageName);
          }
        }

        break;
      default:
    }
    fireTableCellUpdated(row, column);
  }

  public int getColumnCount() {
    return 3;
  }

  public int getRowCount() {
    return allPackages.size();
  }

  public boolean isCellEditable(int row, int column) {
    if (column == INCLUDE_COLUMN_INDEX) {
      return true;
    }
    return false;
  }

}
