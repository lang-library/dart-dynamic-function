import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:dynamic_function/dynamic_function.dart';

final dynamic func01 = DynamicFunction((
  List<dynamic> positional,
  Map<Symbol, dynamic> named,
) {
  print('positional.length=${positional.length}');
  checkNamed(named, ['key1', 'key2'], ['required1']);
  return null;
});

void main() {
  group('test02', () {
    test('func01(1)', () {
      try {
        func01(11, 22, 33, key1: 777, key3: 888);
        fail('Exception expected');
      } catch ($e) {
        dump($e.toString());
        expect(
          $e.toString() == 'Unexpected named parameter: Symbol("key3")',
          isTrue,
        );
        echo('func01(1) test was ok!');
      }
    });
    test('func01(2)', () {
      try {
        func01(11, 22, 33, key1: 777);
        fail('Exception expected');
      } catch ($e) {
        dump($e.toString());
        expect(
          $e.toString() == 'Required named parameter Symbol("required1") not supplied',
          isTrue,
        );
        echo('func01(2) test was ok!');
      }
    });
  });
}
