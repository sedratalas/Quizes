import 'package:flutter/material.dart';
import 'package:quiz_1/question3/screens/user_detail_page.dart';
import 'package:quiz_1/question3/service/user_service.dart';


class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final List<Map<String, dynamic>> users = List.generate(11, (index) => {'id': index});
  final UserService userService = UserService();

  void _navigateToUserDetail(BuildContext context, int id) async {
    final user = await userService.getUserById(id);
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
