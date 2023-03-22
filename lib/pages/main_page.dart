import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_manager/providers.dart';
import 'package:inventory_manager/services/group_service.dart';
import 'package:inventory_manager/widgets/groups_widget.dart';

@immutable
class MainPage extends ConsumerWidget {
  MainPage({super.key});

  final nameController = TextEditingController();

  Future<void> showAddDialog(BuildContext context, User u) async {
    nameController.text = "";
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Group"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Group name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty) {
                  Navigator.of(context).pop();
                  await GroupService.createGroup(u, nameController.text);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(userGroupProvider);
    final list = listState.value;
    final user = ref.watch(userProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text("groups"),
        leading: const Icon(Icons.group),
      ),
      body: const GroupsWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: user != null ? () => showAddDialog(context, user) : null, child: const Icon(Icons.add_box)),
    );
  }
}
