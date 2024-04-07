import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyALu4yPnfzI9oiaxhQFikaOMRqLLuYvOcs",
            authDomain: "uber-4scv7o.firebaseapp.com",
            projectId: "uber-4scv7o",
            storageBucket: "uber-4scv7o.appspot.com",
            messagingSenderId: "366649915062",
            appId: "1:366649915062:web:df7bc3e01d7c5ff4425817"));
  } else {
    await Firebase.initializeApp();
  }
}
