import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventory_manager/models/group.dart';

class GroupService {
  static Future<void> createGroup(User u, String name) async {
    final g = Group.from(
      name: name,
      creator: u.uid,
      creatorName: u.displayName ?? "Uknown",
      data: {},
    );

    await FirebaseFirestore.instance.collection("groups").doc().set(g.toJson());
  }
}
