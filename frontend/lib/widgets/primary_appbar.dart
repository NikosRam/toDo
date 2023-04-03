import 'package:flutter/material.dart';

import '../screens/add_todo_screen.dart';
import '../screens/auth_screen.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Todo List',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 27.0,
        ),
      ),
      centerTitle: true,
      elevation: 8,
      backgroundColor: const Color.fromARGB(255, 255, 219, 112),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
        },
        icon: const Icon(Icons.exit_to_app),
        color: Colors.black,
        iconSize: 35,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(EditToDo.routeName);
          },
          icon: const Icon(Icons.add),
          color: Colors.black,
          iconSize: 40,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
