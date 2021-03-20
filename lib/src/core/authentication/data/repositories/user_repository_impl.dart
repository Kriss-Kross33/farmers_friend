import 'package:farmers_friend/src/core/authentication/domain/entities/user.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final User _user;

  UserRepositoryImpl(this._user) : assert(_user != null);

  @override
  Future<User> getUser() async {
    if (_user != null) return _user;
    return User.empty;
  }
}
