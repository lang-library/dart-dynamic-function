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
    return null;
  }
}

void checkNamed(
  Map<Symbol, dynamic> $named,
  List<String> $optionalNames, [
  List<String>? $requiredNames,
]) {
  $requiredNames ??= <String>[];
  final List<Symbol> $optionalSyms =
      $optionalNames.map(($x) => Symbol($x)).toList();
  final List<Symbol> $requiredSyms =
      $requiredNames.map(($x) => Symbol($x)).toList();
  final $keys = $named.keys.toList();
  for (int $i = 0; $i < $keys.length; $i++) {
    var $key = $keys[$i];
    if ((!$optionalSyms.contains($key)) && (!$requiredSyms.contains($key))) {
      throw 'Unexpected named parameter: ${$key}';
    }
  }
  for (int $i = 0; $i < $requiredSyms.length; $i++) {
    var $sym = $requiredSyms[$i];
    if (!$keys.contains($sym)) {
      throw 'Required named parameter ${$sym} not supplied';
    }
  }
}
