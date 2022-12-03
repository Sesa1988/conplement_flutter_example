import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;

  const Pokemon({required this.name});

  static Pokemon fromMap(Map<String, dynamic> data) {
    return Pokemon(name: data['name']);
  }

  @override
  List<Object> get props => [name];
}
