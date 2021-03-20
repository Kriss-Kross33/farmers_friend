import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  static const empty = User(id: '', country: '', name: '');
  final String id;
  final String name;

  final String country;

  const User({
    @required this.name,
    @required this.country,
    this.id,
  });

  @override
  List<Object> get props => [
        name,
        country,
        id,
      ];
}
