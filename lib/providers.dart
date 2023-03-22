import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_manager/models/group.dart';

final userProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

final userGroupProvider = StreamProvider((ref) {
  final user = ref.watch(userProvider).value;
  if (user != null) {
    return FirebaseFirestore.instance
        .collection("groups")
        .where("creator", isEqualTo: user.uid)
        .snapshots()
        .asyncMap((event) => event.docs.map((e) => e.data()).map((e) => Group.fromJson(e)).toList(growable: false));
  } else {
    return Stream.value(null);
  }
});
final otherGroupProvider = StreamProvider((ref) {
  final user = ref.watch(userProvider).value;
  if (user != null) {
    return FirebaseFirestore.instance
        .collection("groups")
        .where("people", arrayContains: user.uid)
        .snapshots()
        .asyncMap((event) => event.docs.map((e) => e.data()).map((e) => Group.fromJson(e)).toList(growable: false));
  } else {
    return Stream.value(null);
  }
});
