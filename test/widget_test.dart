import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_demo/main.dart';

void main() {

  test('Logic test', () {
    final logic = Logic();

    expect("1", logic.getLabel(1));
    expect("Fizz", logic.getLabel(3));
    expect("Fizz", logic.getLabel(6));
    expect("Buzz", logic.getLabel(5));
    expect("Buzz", logic.getLabel(10));
    expect("FizzBuzz", logic.getLabel(15));
    expect("101", logic.getLabel(101));
  });
}
