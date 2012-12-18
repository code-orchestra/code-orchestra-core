package jetbrains.mps.uiLanguage.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.MPSColors;
import jetbrains.mps.nodeEditor.MPSFonts;

public class Stylesheet_StyleSheet {
  public static Style getAttribute(final EditorCell cell) {
    Style style = new Style(cell);
    style.set(StyleAttributes.TEXT_COLOR, MPSColors.DARK_MAGENTA);
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.PLAIN);
    return style;
  }

  public static Style getComponent(final EditorCell cell) {
    Style style = new Style(cell);
    style.set(StyleAttributes.TEXT_COLOR, MPSColors.blue);
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.BOLD);
    return style;
  }

  public static Style getComponentInstanceName(final EditorCell cell) {
    Style style = new Style(cell);
    style.set(StyleAttributes.TEXT_COLOR, MPSColors.blue);
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.ITALIC);
    return style;
  }

  public static Style getLayoutConstraint(final EditorCell cell) {
    Style style = new Style(cell);
    style.putAll(Stylesheet_StyleSheet.getAttribute(null));
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.BOLD);
    return style;
  }

  public static Style getActionHandler(final EditorCell cell) {
    Style style = new Style(cell);
    style.set(StyleAttributes.TEXT_COLOR, MPSColors.DARK_GREEN);
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.PLAIN);
    return style;
  }

  public static Style getModel(final EditorCell cell) {
    Style style = new Style(cell);
    style.set(StyleAttributes.TEXT_COLOR, MPSColors.DARK_BLUE);
    style.set(StyleAttributes.FONT_STYLE, MPSFonts.PLAIN);
    return style;
  }
}
