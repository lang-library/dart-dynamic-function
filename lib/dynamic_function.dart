import 'dart:core';

typedef FunctionWithArguments =
dynamic Function(
    List<dynamic> $positionalArguments,
    Map<Symbol, dynamic> $namedArguments,
    );

class DynamicFunction {
  final FunctionWithArguments $$function;

  DynamicFunction(this.$$function);

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod && invocation.memberName == const Symbol('call')) {
      return $$function(
        invocation.positionalArguments,
        invocation.namedArguments,
      );
    }
    return;
  }
}
