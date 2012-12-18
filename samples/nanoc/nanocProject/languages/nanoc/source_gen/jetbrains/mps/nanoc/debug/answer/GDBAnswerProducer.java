package jetbrains.mps.nanoc.debug.answer;

/*Generated by MPS */

import jetbrains.mps.util.Pair;

public class GDBAnswerProducer {
  public static final String SAMPLE_STRING = "8209685090165226878^done,locals=[{name=\"i\",value=\"0\"}]\r\n";

  private String myInput;
  private GDBAnswer myGDBAnswer;
  private boolean myHasError = false;
  private int myOffset = 0;

  public GDBAnswerProducer(String input) {
    myInput = input;
    try {
      myGDBAnswer = read();
    } catch (Throwable t) {
      myGDBAnswer = null;
      myHasError = true;
    }
  }

  private void accept(String pattern) {
    int i = 0;
    while (i < pattern.length() && myOffset < myInput.length()) {
      char c1 = pattern.charAt(i);
      char c2 = myInput.charAt(myOffset);
      if (c1 != c2) {
        error("");
        return;
      }
      i++;
      myOffset++;
    }
  }

  public void readEOL() {
    if (currentChar() == '\r') {
      accept("\r\n");
    } else {
      accept("\n");
    }
  }

  public GDBAnswer read() {
    if (currentChar() == '(') {
      accept("(gdb) ");
      readEOL();
      return null;
    } else {
      return readAnswer();
    }
  }

  private Long readToken() {
    StringBuilder sb = new StringBuilder();
    while (Character.isDigit(currentChar())) {
      sb.append(currentChar());
      myOffset++;
    }
    return Long.parseLong(sb.toString());
  }

  private GDBAnswer readAnswer() {
    char c = currentChar();
    Long token = null;
    if (Character.isDigit(c)) {
      token = readToken();
      c = currentChar();
    }
    myOffset++;
    if (c == '*' || c == '+' || c == '=') {
      String asyncClass = readClass();
      RecordValue value = readResultList();
      readEOL();
      AsyncAnswer asyncAnswer = new AsyncAnswer(c, asyncClass, value);
      asyncAnswer.setDigitalToken(token);
      return asyncAnswer;
    } else
    if (c == '~' || c == '@' || c == '&') {
      StringValue value = readString();
      readEOL();
      return new StreamAnswer(c, value.getString());
    } else
    if (c == '^') {
      String resultClass = readClass();
      RecordValue value = readResultList();
      readEOL();
      ResultAnswer resultAnswer = new ResultAnswer(c, resultClass, value);
      resultAnswer.setDigitalToken(token);
      return resultAnswer;
    } else {
      error("");
      return null;
    }
  }

  private String readClass() {
    StringBuilder sb = new StringBuilder();
    while (myOffset < myInput.length()) {
      char c = currentChar();
      if (c == ',' || c == '\n' || c == '\r') {
        myOffset++;
        return sb.toString();
      }
      sb.append(c);
      myOffset++;
    }
    return sb.toString();
  }

  private RecordValue readResultList() {
    if (currentChar() == '\n' || currentChar() == '\r') {
      return null;
    }
    RecordValue recordValue = new RecordValue();
    while (true) {
      Pair<String, GDBValue> pair = readResult();
      recordValue.putProperty(pair.o1, pair.o2);
      if (myOffset >= myInput.length() || currentChar() == '\n' || currentChar() == '\r') {
        return recordValue;
      } else
      if (currentChar() == ',') {
        myOffset++;
      } else {
        error("");
        return null;
      }
    }
  }

  private GDBValue readValue() {
    char c = currentChar();
    if (c == '\"') {
      return readString();
    } else
    if (c == '[') {
      return readList();
    } else
    if (c == '{') {
      return readRecord();
    } else {
      return null;
    }
  }

  private Object getValueOrResult() {
    GDBValue value = readValue();
    if (value == null) {
      return readResult();
    }
    return value;
  }

  private char currentChar() {
    return myInput.charAt(myOffset);
  }

  private void error(String message) {
    myHasError = true;
  }

  private StringValue readString() {
    if (currentChar() != '\"') {
      error("");
      return null;
    }
    myOffset++;
    StringBuilder sb = new StringBuilder();
    while (currentChar() != '\"') {
      sb.append(currentChar());
      myOffset++;
    }
    myOffset++;
    return new StringValue(sb.toString());
  }

  private GDBValue readList() {
    if (currentChar() != '[') {
      error("");
      return null;
    }
    myOffset++;
    if (currentChar() == ']') {
      myOffset++;
      return new ListValue();
    }
    Object first = getValueOrResult();
    boolean isMap = first instanceof Pair;
    if (isMap) {
      ListMapValue listMapValue = new ListMapValue();
      Pair<String, GDBValue> result = (Pair<String, GDBValue>) first;
      while (true) {
        if (currentChar() == ',') {
          listMapValue.addProperty(result.o1, result.o2);
          myOffset++;
        } else
        if (currentChar() == ']') {
          listMapValue.addProperty(result.o1, result.o2);
          myOffset++;
          return listMapValue;
        } else {
          error("");
          return null;
        }
        result = readResult();
      }
    } else {
      ListValue listValue = new ListValue();
      GDBValue value = (GDBValue) first;
      while (true) {
        if (currentChar() == ',') {
          listValue.add(value);
          myOffset++;
        } else
        if (currentChar() == ']') {
          listValue.add(value);
          myOffset++;
          return listValue;
        } else {
          error("");
          return null;
        }
        value = readValue();
      }
    }
  }

  private RecordValue readRecord() {
    if (currentChar() != '{') {
      error("");
      return null;
    }
    myOffset++;
    RecordValue recordValue = new RecordValue();
    if (currentChar() == '}') {
      myOffset++;
      return recordValue;
    }
    while (true) {
      Pair<String, GDBValue> result = readResult();
      if (currentChar() == ',') {
        recordValue.putProperty(result.o1, result.o2);
        myOffset++;
      } else
      if (currentChar() == '}') {
        recordValue.putProperty(result.o1, result.o2);
        myOffset++;
        return recordValue;
      } else {
        error("");
        return null;
      }
    }
  }

  private Pair<String, GDBValue> readResult() {
    StringBuilder varSb = new StringBuilder();
    while (currentChar() != '=') {
      varSb.append(currentChar());
      myOffset++;
    }
    myOffset++;
    GDBValue value = readValue();
    return new Pair<String, GDBValue>(varSb.toString(), value);
  }

  public GDBAnswer getGDBAnswer() {
    return myGDBAnswer;
  }

  public boolean hasError() {
    return myHasError;
  }

  public static void main(String[] args) {
    GDBAnswerProducer gdbAnswer = new GDBAnswerProducer(SAMPLE_STRING);
    System.err.println("");
  }
}
