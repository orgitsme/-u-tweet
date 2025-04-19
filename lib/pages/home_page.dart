import 'package:flutter/material.dart';
import 'package:u_tweet/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Note the 'const' constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("H O M E"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
