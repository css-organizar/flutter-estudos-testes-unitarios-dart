@Timeout(Duration(seconds: 60))

import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../bin/domain/entities/person.dart';
import '../../../../bin/infrastructure/services/mockapi/person_repository.dart';
import 'person_data.dart';

class HttpClientMock extends Mock implements http.Client {}

void main() async {
  group(
    'teste_api_mockapi',
    () {
      final client = http.Client();
      var repository = PersonRepository(client);
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
            'Deve retornar 5 registros',
            () async {
              final apiResult = await repository.getPerson();
              expect(apiResult.length, equals(5));
            },
          );
        },
      );
    },
  );

  group(
    'mocktail test - HttpClient, PersonRepository',
    () {
      late HttpClientMock client;
      late PersonRepository repository;

      setUpAll(
        () {
          client = HttpClientMock();
          repository = PersonRepository(client);
          print('Iniciando os testes');
        },
      );

      tearDownAll(
        () {
          print('Finalizando os testes');
        },
      );

      test(
        'teste person.get()',
        () async {
          when(
            () {
              return client.get(
                Uri.parse('https://61ddc5ebf60e8f0017668a5a.mockapi.io/api/v1/person'),
              );
            },
          ).thenAnswer(
            (invocation) async {
              return http.Response(personData, 200);
            },
          );

          List<Person> apiResult = await repository.getPerson();
          http.Response response =
              await client.get(Uri.parse('https://61ddc5ebf60e8f0017668a5a.mockapi.io/api/v1/person'));

          expect(response.statusCode, equals(200));

          expect(apiResult, isNotEmpty);
          expect(apiResult.isEmpty, equals(false));
          expect(apiResult.length, equals(5));
        },
      );

      test(
        'teste person.get() - Erro 404',
        () async {
          when(
            () {
              return client.get(
                Uri.parse('https://61ddc5ebf60e8f0017668a5a.mockapi.io/api/v1/person'),
              );
            },
          ).thenAnswer(
            (invocation) async {
              return http.Response('', 404);
            },
          );

          expect(() async {
            var retorno = await repository.getPerson();
            return retorno;
          }, throwsException);
        },
        timeout: Timeout(Duration(seconds: 11)),
      );

      test(
        'teste person.get() - Erro 404 - timeout (20s)',
        () async {
          when(
            () {
              return client.get(
                Uri.parse('https://61ddc5ebf60e8f0017668a5a.mockapi.io/api/v1/person'),
              );
            },
          ).thenAnswer(
            (invocation) async {
              await Future.delayed(Duration(seconds: 20));
              return http.Response('', 404);
            },
          );

          expect(() async {
            var retorno = await repository.getPerson();
            return retorno;
          }, throwsException);
        },
        timeout: Timeout(Duration(seconds: 30)),
      );
    },
  );
}
