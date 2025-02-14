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

List<DocumentReference>? convertReferenceExtraService(
    List<String>? referencesList) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // the reference of documents will be passed to the function as in form of list<String> the function convert those to actual document references and return that list of DocumentReferences.
  if (referencesList == null) {
    return null;
  }

  List<DocumentReference> documentReferences = [];
  for (String reference in referencesList) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String documentPath = "/extraService/" + "$reference";
    DocumentReference documentReference = firestore.doc(documentPath);
    documentReferences.add(documentReference);
  }

  return documentReferences;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
