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
}
