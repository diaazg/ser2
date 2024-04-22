import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ser2/features/splash/presentation/views/splash_screen.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBbTjowgwJ6rhGPoWlXP-W7wUn8mLIRnDA", // paste your api key here
      appId: "1:12014682350:android:ba4be5981affc9d2cf33ff", //paste your app id here
      messagingSenderId: '12014682350', //paste your messagingSenderId here
      projectId: "sa7ti-f530e", //paste your project id here
    ),
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home:  SplashScreen(),
    );
  }
}

