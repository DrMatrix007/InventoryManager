import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MainPage extends ConsumerWidget {
  MainPage({required this.user, super.key});

  User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("groups"),
        leading: const Icon(Icons.group),
      ),
    );
  }
}
