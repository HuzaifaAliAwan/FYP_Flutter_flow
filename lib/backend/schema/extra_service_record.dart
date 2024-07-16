import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExtraServiceRecord extends FirestoreRecord {
  ExtraServiceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('extraService');

  static Stream<ExtraServiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExtraServiceRecord.fromSnapshot(s));

  static Future<ExtraServiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExtraServiceRecord.fromSnapshot(s));

  static ExtraServiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExtraServiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExtraServiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExtraServiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExtraServiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExtraServiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExtraServiceRecordData({
  String? name,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExtraServiceRecordDocumentEquality
    implements Equality<ExtraServiceRecord> {
  const ExtraServiceRecordDocumentEquality();

  @override
  bool equals(ExtraServiceRecord? e1, ExtraServiceRecord? e2) {
    return e1?.name == e2?.name && e1?.price == e2?.price;
  }

  @override
  int hash(ExtraServiceRecord? e) =>
      const ListEquality().hash([e?.name, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ExtraServiceRecord;
}
