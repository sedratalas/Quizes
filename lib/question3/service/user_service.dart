import 'package:faker/faker.dart';
import '../models/user.dart';

class UserService {
  final Map<int, User> _cachedUsers = {};

  Future<User> getUserById(int id) async {
    if (_cachedUsers.containsKey(id)) {
      return _cachedUsers[id]!;
    } else {
      final faker = Faker();
      final user = User(
        id: id,
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        about: faker.lorem.words(3).join(' '),
        image: faker.image.image(),
        email: faker.internet.email(),
      );
      _cachedUsers[id] = user;
      return user;
    }
  }
}
