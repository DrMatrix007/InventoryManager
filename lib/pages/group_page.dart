import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_manager/models/group.dart';
import 'package:inventory_manager/widgets/input_dialog.dart';

class GroupPage extends ConsumerWidget {
  GroupPage({super.key, required this.docId});

  String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("groups")
          .doc(docId)
          .snapshots()
          .asyncMap((event) {
        final data = event.data();
        if (data != null) {
          return Group.fromJson(data, event.id);
        }
        return null;
      }),
      builder: (context, snapshot) {
        Map<String, TextEditingController> controllers = {};
        final data = snapshot.data;
        if (data != null) {
          controllers = data.data.map((key, value) =>
              MapEntry(key, TextEditingController(text: value.toString())));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data?.name ?? "Uknown"),
          ),
          body: Column(
            children: controllers.entries
                .map(
                  (e) => Row(
                    children: [Text("${e.key}: ")],
                  ),
                )
                .toList(growable: false),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final name = await showDialog(
                context: context,
                builder: (context) =>
                    TextInputDialog(description: "Enter new Value name"),
              );
              
            },
            child: const Icon(Icons.note_add_sharp),
          ),
        );
      },
    );
  }
}
