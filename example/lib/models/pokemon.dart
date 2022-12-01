import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Pokemon extends Equatable {
  final String name;
  final String url;

  const Pokemon({required this.name, required this.url});

  Pokemon copyWith({String? name, String? description}) {
    return Pokemon(
      name: name ?? this.name,
      url: description ?? this.url,
    );
  }

  static Pokemon fromMap(Map<String, dynamic> data) {
    return Pokemon(
      name: data['name'],
      url: data['url'],
    );
  }

  @override
  List<Object> get props => [name, url];
}
