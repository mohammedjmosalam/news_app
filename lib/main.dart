import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/root/app_roots.dart';
import 'config/root/on_generate_root.dart';
import 'data/loacal/hive_local_storg.dart';

Future<void> main() async {
  await Hive.initFlutter('./');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => HiveStorg()..initDataBase(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        onGenerateRoute: OnGenerateRoot.onGenerateRoute,
        initialRoute: AppRoot.home,
      ),
    );
  }
}
