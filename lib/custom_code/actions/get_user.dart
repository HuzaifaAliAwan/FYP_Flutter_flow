// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<UsersRecord?> getUser(DocumentReference? userReference) async {
  // Return null if userReference is null, otherwise fetch the document from Firebase.

  if (userReference == null) {
    return null;
  }

  try {
    DocumentSnapshot snapshot = await userReference.get();
    if (snapshot.exists) {
      return UsersRecord.fromSnapshot(snapshot);
    } else {
      throw Exception("User not found");
    }
  } catch (e) {
    throw Exception("Error getting user: $e");
  }
}
