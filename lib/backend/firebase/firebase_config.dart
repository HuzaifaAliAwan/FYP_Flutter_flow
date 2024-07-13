import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDMieJXmlkiyUgtxbGqK197unmDAWdGNzo",
            authDomain: "test-agr7m5.firebaseapp.com",
            projectId: "test-agr7m5",
            storageBucket: "test-agr7m5.appspot.com",
            messagingSenderId: "113138426348",
            appId: "1:113138426348:web:26a38bf47429e8d95fa0c9"));
  } else {
    await Firebase.initializeApp();
  }
}
