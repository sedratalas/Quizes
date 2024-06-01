// import 'package:flutter/material.dart';
// import 'package:quiz_1/question1/AI_model.dart';
// import 'app.dart';
//
// void main(){
//   runApp(const MyApp());
// }
//
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final List<Map<String, dynamic>> users = List.generate(11, (index) => {'id': index});
  final Map<int, Map<String, dynamic>> _cachedUsers = {};

  Future<Map<String, dynamic>> getUserById(int id) async {
    if (_cachedUsers.containsKey(id)) {
      return _cachedUsers[id]!;
    } else {
      final faker = Faker();
      final user = {
        'id': id,
        'first_name': faker.person.firstName(),
        'last_name': faker.person.lastName(),
        'about': faker.lorem.words(3).join(' '),
        'image': faker.image.image(),
        'email': faker.internet.email(),
      };
      _cachedUsers[id] = user;
      return user;
    }
  }

  void _navigateToUserDetail(BuildContext context, int id) async {
    final user = await getUserById(id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User ${users[index]['id']}'),
            onTap: () => _navigateToUserDetail(context, users[index]['id']),
          );
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${user['first_name']} ${user['last_name']}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(user['image']),
            SizedBox(height: 16),
            Text('${user['first_name']} ${user['last_name']}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Email: ${user['email']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('About: ${user['about']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
