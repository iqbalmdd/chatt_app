import 'package:chatt_app/components/user_tile.dart';
import 'package:chatt_app/pages/chatt_page.dart';
import 'package:chatt_app/services/auth/auth_service.dart';
import 'package:chatt_app/components/my_drawer.dart';
import 'package:chatt_app/services/chatt/chatt_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _chattService = ChattService();
  final _authService = AuthService();

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build list of users except current logged user
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chattService.getUserStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading . . .");
          }

          // list tile
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChattPage(receiverEmail: userData["email"])));
      },
    );
  }
}
