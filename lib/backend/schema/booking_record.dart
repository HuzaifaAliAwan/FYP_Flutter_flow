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
  String? _noOfGuests;
  String get noOfGuests => _noOfGuests ?? '';
  bool hasNoOfGuests() => _noOfGuests != null;

  // "activeStatus" field.
  bool? _activeStatus;
  bool get activeStatus => _activeStatus ?? false;
  bool hasActiveStatus() => _activeStatus != null;

  // "reqApproved" field.
  bool? _reqApproved;
  bool get reqApproved => _reqApproved ?? false;
  bool hasReqApproved() => _reqApproved != null;

  // "propertyOwnerId" field.
  DocumentReference? _propertyOwnerId;
  DocumentReference? get propertyOwnerId => _propertyOwnerId;
  bool hasPropertyOwnerId() => _propertyOwnerId != null;

  // "showInHistoryPropertyOwner" field.
  bool? _showInHistoryPropertyOwner;
  bool get showInHistoryPropertyOwner => _showInHistoryPropertyOwner ?? false;
  bool hasShowInHistoryPropertyOwner() => _showInHistoryPropertyOwner != null;

  // "showInHistoryCustomer" field.
  bool? _showInHistoryCustomer;
  bool get showInHistoryCustomer => _showInHistoryCustomer ?? false;
  bool hasShowInHistoryCustomer() => _showInHistoryCustomer != null;

  void _initializeFields() {
    _propertyId = snapshotData['propertyId'] as DocumentReference?;
    _customerId = snapshotData['customerId'] as DocumentReference?;
    _checkInDate = snapshotData['checkInDate'] as DateTime?;
    _checkOutDate = snapshotData['checkOutDate'] as DateTime?;
    _noOfGuests = snapshotData['noOfGuests'] as String?;
    _activeStatus = snapshotData['activeStatus'] as bool?;
    _reqApproved = snapshotData['reqApproved'] as bool?;
    _propertyOwnerId = snapshotData['propertyOwnerId'] as DocumentReference?;
    _showInHistoryPropertyOwner =
        snapshotData['showInHistoryPropertyOwner'] as bool?;
    _showInHistoryCustomer = snapshotData['showInHistoryCustomer'] as bool?;
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
  String? noOfGuests,
  bool? activeStatus,
  bool? reqApproved,
  DocumentReference? propertyOwnerId,
  bool? showInHistoryPropertyOwner,
  bool? showInHistoryCustomer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyId': propertyId,
      'customerId': customerId,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'noOfGuests': noOfGuests,
      'activeStatus': activeStatus,
      'reqApproved': reqApproved,
      'propertyOwnerId': propertyOwnerId,
      'showInHistoryPropertyOwner': showInHistoryPropertyOwner,
      'showInHistoryCustomer': showInHistoryCustomer,
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
        e1?.noOfGuests == e2?.noOfGuests &&
        e1?.activeStatus == e2?.activeStatus &&
        e1?.reqApproved == e2?.reqApproved &&
        e1?.propertyOwnerId == e2?.propertyOwnerId &&
        e1?.showInHistoryPropertyOwner == e2?.showInHistoryPropertyOwner &&
        e1?.showInHistoryCustomer == e2?.showInHistoryCustomer;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.propertyId,
        e?.customerId,
        e?.checkInDate,
        e?.checkOutDate,
        e?.noOfGuests,
        e?.activeStatus,
        e?.reqApproved,
        e?.propertyOwnerId,
        e?.showInHistoryPropertyOwner,
        e?.showInHistoryCustomer
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
