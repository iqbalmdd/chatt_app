import 'package:chatt_app/pages/about_page.dart';
import 'package:chatt_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String username;

  MyDrawer({super.key, required this.username});

  final _authService = AuthService();

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Header
              DrawerHeader(
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface, // Adjust the text color
                      ),
                    )
                  ],
                ),
              ),

              // About ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("About PSMTI"),
                  leading: Icon(Icons.info,
                      color: const Color.fromARGB(255, 47, 129, 197)),
                  onTap: () {Navigator.pushNamed(context, '/about');},
                ),
              ),

              // Agenda ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Agenda Kegiatan"),
                  leading: Icon(Icons.view_agenda,
                      color: const Color.fromARGB(255, 47, 129, 197)),
                  onTap: () {},
                ),
              ),

              // Gallery ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Gallery"),
                  leading: Icon(Icons.photo_album,
                      color: const Color.fromARGB(255, 47, 129, 197)),
                  onTap: () {},
                ),
              ),

              // Chatt ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Chatt"),
                  leading: Icon(Icons.chat_bubble,
                      color: const Color.fromARGB(255, 47, 129, 197)),
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),

          // Logout ListTile
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout,
                  color: const Color.fromARGB(255, 47, 129, 197)),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
