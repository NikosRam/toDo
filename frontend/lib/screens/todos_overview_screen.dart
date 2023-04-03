import 'package:flutter/material.dart';

import '../widgets/primary_appbar.dart';
import '../widgets/todo_listview.dart';

class ToDosOverviewScreen extends StatelessWidget {
  const ToDosOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PrimaryAppBar(),
      body: ToDoListView(),
    );
  }
}
