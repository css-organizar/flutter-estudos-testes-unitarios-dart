import 'package:test/test.dart';

import '../../../../bin/domain/entities/person.dart';
import '../../../../bin/infrastructure/services/mockapi/person_repository.dart';

void main() async {
  group(
    'teste_api_mockapi',
    () {
      var repository = PersonRepository();
      group(
        'endpoint_person',
        () {
          test(
            'Resultado não pode ser nulo - expected_equals',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult.isNotEmpty, equals(true));
            },
          );

          test(
            'Resultado não pode ser nulo - expected_isNotEmpty',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult, isNotEmpty);
            },
          );

          test(
            'Resultado deve ser uma lista',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult, isA<List>());
            },
          );

          test(
            'Resultado deve ser uma lista do tipo List<Person>',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult, isA<List<Person>>());
            },
          );

          test(
            'Deve retornar 50 registros',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult.length, equals(50));
            },
          );
        },
      );
    },
  );
}
