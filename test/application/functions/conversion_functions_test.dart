import 'package:test/test.dart';

import '../../../bin/application/functions/conversion_functions.dart';

void main() async {
  group(
    'function: convertToInteger()',
    () {
      test(
        'string_values',
        () {
          expect(() => convertToInteger('a'), throwsException);
          expect(convertToInteger('false'), 0);
          expect(convertToInteger('true'), 1);
          expect(convertToInteger('FALSE'), 0);
          expect(convertToInteger('TRUE'), 1);
          expect(convertToInteger('0'), equals(0));
          expect(convertToInteger('-1'), equals(-1));
          expect(convertToInteger('1.0'), equals(1));
          expect(convertToInteger('-1.0'), equals(-1));
          expect(convertToInteger('.0524'), equals(0));
        },
      );

      test(
        'integer_values',
        () {
          expect(convertToInteger(1), equals(1));
          expect(convertToInteger(2), equals(2));
          expect(convertToInteger(10), equals(10));
          expect(convertToInteger(0200), equals(200));
          expect(convertToInteger(-1), equals(-1));
          expect(convertToInteger(0), equals(0));
        },
      );

      test(
        'double_values',
        () {
          expect(convertToInteger(1.0), equals(1));
          expect(convertToInteger(1.123), equals(1));
          expect(convertToInteger(.123), equals(0));
          expect(convertToInteger(1.7), equals(1));
          expect(convertToInteger(70.56), equals(70));
          expect(convertToInteger(-1.123), equals(-1));
          expect(convertToInteger(-.123), equals(0));
        },
      );

      test(
        'bool_values',
        () {
          expect(convertToInteger(false), equals(0));
          expect(convertToInteger(true), equals(1));
          expect(convertToInteger((1 == 1)), equals(1));
          expect(convertToInteger((1 == 2)), equals(0));
        },
      );

      test(
        'other_values',
        () {
          expect(convertToInteger('0xFFFFFFFF'), equals(4294967295));
          expect(convertToInteger(0xFFFFFFFF), equals(4294967295));
          expect(() => convertToInteger([]), throwsException);
          expect(() => convertToInteger({}), throwsException);
        },
      );
    },
  );

  group(
    'function: convertToBool()',
    () {
      test(
        'string_values',
        () {
          expect(() => convertToBool('a'), throwsException);
          expect(convertToBool('false'), equals(false));
          expect(convertToBool('true'), equals(true));
          expect(convertToBool('FALSE'), equals(false));
          expect(convertToBool('TRUE'), equals(true));
          expect(convertToBool('0'), equals(false));
          expect(convertToBool('1'), equals(true));
          expect(() => convertToBool('2'), throwsException);
          expect(() => convertToBool('-1.0'), throwsException);
          expect(() => convertToBool('.0524'), throwsException);
        },
      );

      test(
        'integer_values',
        () {
          expect(convertToBool(0), equals(false));
          expect(convertToBool(1), equals(true));
          expect(() => convertToBool(2), throwsException);
        },
      );
    },
  );

  group(
    'function: convertToDouble()',
    () {
      test(
        'string_values',
        () {
          expect(() => convertToDouble('a'), throwsException);
          expect(convertToDouble('0'), equals(0));
          expect(convertToDouble('-1'), equals(-1));
          expect(convertToDouble('1.0'), equals(1));
          expect(convertToDouble('-1.0'), equals(-1));
          expect(convertToDouble('.0524'), equals(.0524));
        },
      );

      test(
        'integer_values',
        () {
          expect(convertToDouble(1), equals(1));
          expect(convertToDouble(2), equals(2));
          expect(convertToDouble(10), equals(10));
          expect(convertToDouble(0200), equals(200));
          expect(convertToDouble(-1), equals(-1));
          expect(convertToDouble(0), equals(0));
        },
      );

      test(
        'double_values',
        () {
          expect(convertToDouble(1.0), equals(1.0));
          expect(convertToDouble(1.123), equals(1.123));
          expect(convertToDouble(.123), equals(.123));
          expect(convertToDouble(1.7), equals(1.7));
          expect(convertToDouble(70.56), equals(70.56));
          expect(convertToDouble(-1.123), equals(-1.123));
          expect(convertToDouble(-.123), equals(-.123));
        },
      );

      test(
        'other_values',
        () {
          expect(convertToDouble('0xFFFFFFFF'), equals(4294967295));
          expect(convertToDouble(0xFFFFFFFF), equals(4294967295));
          expect(() => convertToDouble(false), throwsException);
          expect(() => convertToDouble('false'), throwsException);
          expect(() => convertToDouble([]), throwsException);
          expect(() => convertToDouble({}), throwsException);
        },
      );
    },
  );

  group(
    'function: convertToString()',
    () {
      test(
        'string_values',
        () {
          expect(convertToString('a'), equals('a'));
          expect(convertToString('false'), equals('false'));
          expect(convertToString('true'), equals('true'));
          expect(convertToString('FALSE'), equals('FALSE'));
          expect(convertToString('TRUE'), equals('TRUE'));
          expect(convertToString('0'), equals('0'));
          expect(convertToString('1'), equals('1'));
          expect(convertToString('2'), '2');
          expect(convertToString('1.0'), '1.0');
          expect(convertToString('-1.0'), '-1.0');
          expect(convertToString('.0524'), '.0524');
        },
      );

      test(
        'integer_values',
        () {
          expect(convertToString(1), equals('1'));
          expect(convertToString(2), equals('2'));
          expect(convertToString(10), equals('10'));
          expect(convertToString(0200), equals('200'));
          expect(convertToString(-1), equals('-1'));
          expect(convertToString(0), equals('0'));
        },
      );

      test(
        'double_values',
        () {
          expect(convertToString(1.0), equals('1.0'));
          expect(convertToString(1.123), equals('1.123'));
          expect(convertToString(.123), equals('0.123'));
          expect(convertToString(1.7), equals('1.7'));
          expect(convertToString(70.56), equals('70.56'));
          expect(convertToString(-1.123), equals('-1.123'));
          expect(convertToString(-.123), equals('-0.123'));
        },
      );

      test(
        'bool_values',
        () {
          expect(convertToString(false), equals('false'));
          expect(convertToString(true), equals('true'));
          expect(convertToString((1 == 1)), equals('true'));
          expect(convertToString((1 == 2)), equals('false'));
        },
      );

      test(
        'other_values',
        () {
          expect(convertToString('0xFFFFFFFF'), equals('0xFFFFFFFF'));
          expect(convertToString(0xFFFFFFFF), equals('4294967295'));
          expect(convertToString([]), equals('[]'));
          expect(convertToString({}), equals('{}'));
        },
      );
    },
  );
}
