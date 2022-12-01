import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Pokemon extends Equatable {
  final String name;

  const Pokemon({required this.name});

  Pokemon copyWith({String? name, String? description}) {
    return Pokemon(name: name ?? this.name);
  }

  static Pokemon fromMap(Map<String, dynamic> data) {
    return Pokemon(name: data['name']);
  }

  @override
  List<Object> get props => [name];
}
