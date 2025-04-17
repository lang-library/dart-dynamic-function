# dart-dynamic-function

## Demo

```
# pubspec.yaml
name: demo_app
description: A sample command-line application
version: 0.0.1
publish_to: none

environment:
  sdk: ^3.7.2

dependencies:
  dynamic_function: ^1.0.1

dev_dependencies:
```

```
// func_demo.dart
import 'package:dynamic_function/dynamic_function.dart';

final dynamic sum = DynamicFunction((
  List<dynamic> positional,
  Map<Symbol, dynamic> named,
) {
  print('positional.length=${positional.length}');
  int result = 0;
  for (int i = 0; i < positional.length; i++) {
    result += positional[i] as int;
  }
  return result;
});

void main() {
  int answer = sum(11, 22, 33);
  print('answer=$answer');
}

/*
[Result]
positional.length=3
answer=66
 */
```

```
// class_demo.dart
import 'package:dynamic_function/dynamic_function.dart';

class MyNumber {
  final int _num;

  MyNumber(this._num);

  late final dynamic addNumbers = DynamicFunction((
    List<dynamic> positional,
    Map<Symbol, dynamic> named,
  ) {
    print('positional.length=${positional.length}');
    int result = _num;
    for (int i = 0; i < positional.length; i++) {
      result += positional[i] as int;
    }
    return result;
  });
}

void main() {
  final myNum = MyNumber(11);
  int answer = myNum.addNumbers(22, 33);
  print('answer=$answer');
}

/*
[Result]
positional.length=2
answer=66
 */
```
