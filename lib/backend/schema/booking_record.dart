import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propertyId" field.
  DocumentReference? _propertyId;
  DocumentReference? get propertyId => _propertyId;
  bool hasPropertyId() => _propertyId != null;

  // "customerId" field.
  DocumentReference? _customerId;
  DocumentReference? get customerId => _customerId;
  bool hasCustomerId() => _customerId != null;

  // "checkInDate" field.
  DateTime? _checkInDate;
  DateTime? get checkInDate => _checkInDate;
  bool hasCheckInDate() => _checkInDate != null;

  // "checkOutDate" field.
  DateTime? _checkOutDate;
  DateTime? get checkOutDate => _checkOutDate;
  bool hasCheckOutDate() => _checkOutDate != null;

  // "noOfGuests" field.
  int? _noOfGuests;
  int get noOfGuests => _noOfGuests ?? 0;
  bool hasNoOfGuests() => _noOfGuests != null;

  void _initializeFields() {
    _propertyId = snapshotData['propertyId'] as DocumentReference?;
    _customerId = snapshotData['customerId'] as DocumentReference?;
    _checkInDate = snapshotData['checkInDate'] as DateTime?;
    _checkOutDate = snapshotData['checkOutDate'] as DateTime?;
    _noOfGuests = castToType<int>(snapshotData['noOfGuests']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  DocumentReference? propertyId,
  DocumentReference? customerId,
  DateTime? checkInDate,
  DateTime? checkOutDate,
  int? noOfGuests,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyId': propertyId,
      'customerId': customerId,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'noOfGuests': noOfGuests,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    return e1?.propertyId == e2?.propertyId &&
        e1?.customerId == e2?.customerId &&
        e1?.checkInDate == e2?.checkInDate &&
        e1?.checkOutDate == e2?.checkOutDate &&
        e1?.noOfGuests == e2?.noOfGuests;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.propertyId,
        e?.customerId,
        e?.checkInDate,
        e?.checkOutDate,
        e?.noOfGuests
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
