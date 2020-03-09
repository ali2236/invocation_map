import 'dart:convert';

class InvocationMap {
  final Map<Symbol, dynamic> _members = {};

  @override
  noSuchMethod(Invocation invocation) {
    final name = _normilizeSymbol(invocation.memberName);

    if (invocation.isSetter) {
      return _members[name] = invocation.positionalArguments.first;
    }

    if (invocation.isGetter) {
      return _members[name];
    }
  }

  Symbol _normilizeSymbol(Symbol symbol){
    var string = symbol.toString();

    string = string.replaceAll('=', '');

    return Symbol(string);
  }
}
