import 'package:test/test.dart';
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
  group('test01', () {
    test('simple', () {
      int answer = sum(11, 22, 33);
      print('answer=$answer');
      expect(answer == 66, isTrue);
    });
    test('class', () {
      final myNum = MyNumber(11);
      int answer = myNum.addNumbers(22, 33);
      print('answer=$answer');
      expect(answer == 66, isTrue);
    });
  });
}
