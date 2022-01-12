@Timeout(Duration(seconds: 30))
@Tags(['tag_person'])

import 'package:test/test.dart';

import '../../../bin/domain/entities/person.dart';

void main() async {
  late Person person;

  group(
    'Testes da Classe Person()',
    () {
      group(
        'Instance',
        () {
          test(
            'Este Objeto deve ser uma Instância de Person()',
            () {
              person = Person('1', 'Claudney', 37, 1.81, 140);
              expect(person, isA<Person>());
            },
          );
        },
      );

      group(
        'Types',
        () {
          test(
            'imc deve ser um double',
            () {
              person = Person('1', 'Claudney', 37, 1.81, 140);
              expect(person.imc, isNotNull);
              expect(person.imc, greaterThan(0));
              expect(person.imc, isA<double>());

              expect(
                person.imc,
                allOf(
                  [
                    isNotNull,
                    greaterThan(0),
                    isA<double>(),
                  ],
                ),
              );
            },
          );

          test(
            'isOlder deve ser um bool',
            () {
              person = Person('1', 'Claudney', 37, 1.81, 140);
              expect(person.isOlder, isNotNull);
              expect(person.isOlder, isA<bool>());

              expect(
                person.isOlder,
                allOf(
                  [
                    isNotNull,
                    isA<bool>(),
                  ],
                ),
              );
            },
          );
        },
      );

      group(
        'Functions',
        () {
          group(
            'imc',
            () {
              test(
                'O IMC deve ser 42,73',
                () {
                  person = Person('1', 'Claudney', 37, 1.81, 140);
                  expect(person.imc, 42.73);
                },
              );
            },
          );

          group(
            'isOlder',
            () {
              test(
                'Se idade = 18 deve ser true',
                () {
                  person = Person('1', 'Claudney', 37, 1.81, 140);
                  expect(person.isOlder, true);
                },
              );

              test(
                'Se idade > 18 deve ser true',
                () {
                  person = Person('1', 'Claudney', 37, 1.81, 140);
                  expect(person.isOlder, true);
                },
              );

              test(
                'Se idade < 18 deve ser false',
                () {
                  person = Person('2', 'Isadora', 6, 0.83, 24);
                  expect(person.isOlder, false);
                },
              );
            },
          );
        },
      );

      group('Validando Erro em Retorno de Funções', () {
        test(
          'Skip - Erro ao tentar converter idade de uma string inválida Skip',
          () {
            person = Person('0', 'Administrador', 6, 0.83, 24);
            expect(() => int.parse('_10'), throwsA(isA<NullThrownError>()));
          },
          skip: 'Testando se o Skip Funciona, esperando NullThrownError e recebe Exception',
        );
        test(
          'Erro ao tentar converter idade de uma string inválida throwsA',
          () {
            person = Person('0', 'Administrador', 6, 0.83, 24);
            expect(() => int.parse('_10'), throwsA(isA<Exception>()));
          },
          tags: 'tag_teste',
        );
        test(
          'Erro ao tentar converter idade de uma string inválida throwsException',
          () {
            person = Person('0', 'Administrador', 6, 0.83, 24);
            expect(() => int.parse('_10'), throwsException);
          },
          timeout: Timeout(
            Duration(seconds: 15),
          ),
        );
      }, tags: ['tag_teste', 'tag_grupo']);
    },
  );
}
