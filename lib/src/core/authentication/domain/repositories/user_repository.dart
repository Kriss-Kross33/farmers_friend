import 'package:farmers_friend/src/core/authentication/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
