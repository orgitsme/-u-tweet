import 'package:flutter/material.dart';

/*
Drawer title 

This is the simple title for each item in menu bar 
-------------------------------------------------------------------------
*/

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  //  Build UI
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      onTap: onTap,
    );
  }
}
