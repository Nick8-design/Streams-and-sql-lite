import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reglog/provider.dart';
import 'package:reglog/ui/reglog_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repositories/db_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  final sharedPrefs = await SharedPreferences.getInstance();
  final repository = DbRepository();
  await repository.init();
  runApp(
      ProviderScope(
  overrides: [
    sharedPrefProvider.overrideWithValue(sharedPrefs),
    repositoryProvider.overrideWith(() { return repository; }),
  ],

   child:    const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReglogSwitch(),
    );
  }
}

