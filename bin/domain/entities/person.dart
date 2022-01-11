import 'dart:convert';
import 'dart:math' as math;

class Person {
  final String id;
  final String name;
  final int age;
  final double height;
  final double weight;

  Person(
    this.id,
    this.name,
    this.age,
    this.height,
    this.weight,
  );

  double get imc {
    double result = weight / math.pow(height, 2);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get isOlder {
    return (age >= 18);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      map['id'] ?? '',
      map['name'] ?? '',
      map['age']?.toInt() ?? 0,
      map['height']?.toDouble() ?? 0.0,
      map['weight']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
