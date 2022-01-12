import 'dart:convert';
import 'package:http/http.dart';

import '../../../domain/entities/person.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<Person>> getPerson() async {
    Response response = await client.get(Uri.parse('https://61ddc5ebf60e8f0017668a5a.mockapi.io/api/v1/person'));

    try {
      if (response.statusCode == 200) {
        var resultString = response.body;
        var resultJson = jsonDecode(resultString) as List;
        return resultJson.map((e) => Person.fromMap(e)).toList();
      } else {
        throw Exception('Erro (404)');
      }
    } catch (e) {
      throw Exception('Erro: ${e.toString()}');
    }
  }
}
