import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_tweet/components/my_settings_tile.dart';
import 'package:u_tweet/pages/themes/theme_provider.dart';

/* Settings Page

- Dark Mode
- Blocked User 
- Account Setting 
*/

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),

      // Body
      body: Column(
        children: [
          // Dark Mode Tile
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
              value: themeProvider.isDarkMode,
            ),
          ),

          // Blocked User Tile
          // Add relevant implementation here

          // Account Settings Tile
          // Add relevant implementation here
        ],
      ),
    );
  }
}
