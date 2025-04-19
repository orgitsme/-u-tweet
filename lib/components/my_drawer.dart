import 'package:flutter/material.dart';
import 'package:u_tweet/components/my_drawer_tile.dart';
import 'package:u_tweet/pages/settings_page.dart';
import 'package:u_tweet/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  // Access auth service
  final _auth = AuthService();

  // Logout function
  void logout() {
    _auth.logout();
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // App logo / icon
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // Divider
              const Divider(
                color: Colors.white,
              ),

              const SizedBox(height: 10),

              // HOME
              MyDrawerTile(
                title: "H O M E",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // PROFILE
              MyDrawerTile(
                title: "P R O F I L E",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // SEARCH
              MyDrawerTile(
                title: "S E A R C H",
                icon: Icons.search,
                onTap: () {},
              ),

              // SETTINGS
              MyDrawerTile(
                title: "S E T T I N G",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // LOGOUT
              MyDrawerTile(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: () => logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
