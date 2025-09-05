import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  test('empty string returns 0', () {
    final calc = StringCalculator();
    expect(calc.add(''), 0);
  });

  test('single number returns the value', () {
    final calc = StringCalculator();
    expect(calc.add('1'), 1);
  });

  test('two numbers separated by comma', () {
    final calc = StringCalculator();
    expect(calc.add('1,5'), 6);
  });

  test('any amount of comma-separated numbers', () {
    final calc = StringCalculator();
    expect(calc.add('1,2,3,4'), 10);
  });

  test('numbers can be separated by commas or newlines', () {
    final calc = StringCalculator();
    expect(calc.add('1\n2,3'), 6);
  });

    test('custom single-character delimiter', () {
    final calc = StringCalculator();
    expect(calc.add('//;\n1;2'), 3);
  });
  test('throws exception on negative numbers', () {
    final calc = StringCalculator();
    expect(() => calc.add('1,-2,3'), throwsA(isA<FormatException>()));
  });

  test('exception message contains all negatives', () {
    final calc = StringCalculator();
    expect(
      () => calc.add('1,-2,3,-4'),
      throwsA(predicate((e) =>
          e is FormatException &&
          e.message.contains('-2') &&
          e.message.contains('-4'))),
    );
  });

    test('custom multi-character delimiter using brackets', () {
    final calc = StringCalculator();
    expect(calc.add('//[***]\n1***2***3'), 6);
  });


}
