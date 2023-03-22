import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_manager/firebase_options.dart';
import 'package:inventory_manager/pages/login_page.dart';
import 'package:inventory_manager/pages/main_page.dart';
import 'package:inventory_manager/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;

    return MaterialApp(title: 'Material App', home: user != null ? MainPage() : const LoginPage());
  }
}
