module hsc.parse.ast.node;

import hsc.parse.lex : Token;
import hsc.parse.lex : TokenType;

abstract class Node {
  Node parent;

  Token tok;

  static immutable stringFunc = "override string toString() { import std.traits; return fullyQualifiedName!(typeof(this)); }";

  private this() {}

  public this(Token t) {
    this.tok = t;
  }

  @property public string name() {
    return tok.value;
  }
}

class FunctionCall : Node {
  public Node[] arguments;

  private this() {}

  public this(Token t) {
    this.tok = t;
  }

  mixin(stringFunc);
}

class FunctionDef : FunctionCall {
  public string returnType;
  public string scriptType;

  public this(Token t) {
    this.tok = t;
  }

  mixin(stringFunc);
}

class VariableDef : FunctionCall {
  public string type;
  public string _name;
  public Node initialValue;

  public this(Token t) {
    this.tok = t;
  }

  @property override public string name() {
    return _name;
  }

  @property public string name(string val) {
    return _name = val;
  }

  mixin(stringFunc);
}

class Literal : Node {
  public this(Token t) {
    this.tok = t;
  }

  @property string type() {
    switch (tok.type) {
    case TokenType.Number:
      return "Number";
    case TokenType.Text:
      return "Text";
    default:
      return "unk";
    }
  }

  mixin(stringFunc);
}

class Identifier : Node {
  public this(Token t) {
    this.tok = t;
  }

  mixin(stringFunc);
}
