import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Init {
  static Future<dynamic> initialize() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      if (FirebaseAuth.instance.currentUser == null) {
        return "not_logged_in";
      } else {
        return "logged_in";
      }
    } catch (err) {
      //TODO log err
      return null;
    }
  }
}