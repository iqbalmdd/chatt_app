import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
                      "Iqbal Muhammad",
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

              // Home ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Setting ListTile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text("Setting"),
                  leading: Icon(Icons.settings,
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
