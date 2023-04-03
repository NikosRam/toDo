import 'package:flutter/material.dart';

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
          fontStyle: FontStyle.italic,
        ),
      ),
      centerTitle: true,
      elevation: 8,
      backgroundColor: const Color.fromARGB(255, 255, 219, 112),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
