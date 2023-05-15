import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/home.dart';
import 'Views/send.dart';
import 'Views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'madame wonder transfert',
        theme: ThemeData(
          fontFamily: 'lucida',
          indicatorColor: const Color.fromARGB(255, 255, 255, 255),
        ).copyWith(
          // change the focus border color of the TextField
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(
                primary: const Color(0xff21725E),
              )
              .copyWith(onBackground: const Color(0xffffffff))
              .copyWith(error: const Color.fromARGB(255, 127, 40, 40)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/home': (context) => const HomePage(),
          '/send': (context) => const Send(),
        });
  }
}
