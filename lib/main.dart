import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ser2/app.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBbTjowgwJ6rhGPoWlXP-W7wUn8mLIRnDA",
      appId: "1:12014682350:android:ba4be5981affc9d2cf33ff", 
      messagingSenderId: '12014682350', 
      projectId: "sa7ti-f530e",
      storageBucket: "sa7ti-f530e.appspot.com", 
    ),
   );
      FirebaseAuth authInstance = FirebaseAuth.instance;
        FirebaseFirestore storeInstance=FirebaseFirestore.instance;
  runApp( MyApp(authRepo: AuthRepoImp(authInstance: authInstance, storeInstance: storeInstance),));
}



