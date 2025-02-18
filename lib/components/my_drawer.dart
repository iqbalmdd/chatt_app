import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  const MyDrawer({
    super.key,
    required this.username
    });

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

              // Chatt ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Chatt"),
                  leading: Icon(Icons.chat_bubble,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // About ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("About PSMTI"),
                  leading: Icon(Icons.info,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: () {},
                ),
              ),

            // Gallery ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Gallery"),
                  leading: Icon(Icons.photo_album,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: () {},
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
                  color: Theme.of(context).colorScheme.primary),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
