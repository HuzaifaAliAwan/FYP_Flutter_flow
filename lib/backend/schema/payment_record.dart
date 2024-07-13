import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "bookingId" field.
  DocumentReference? _bookingId;
  DocumentReference? get bookingId => _bookingId;
  bool hasBookingId() => _bookingId != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _bookingId = snapshotData['bookingId'] as DocumentReference?;
    _paymentMode = snapshotData['paymentMode'] as String?;
    _paymentStatus = snapshotData['paymentStatus'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment');

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentRecordData({
  String? id,
  DocumentReference? bookingId,
  String? paymentMode,
  String? paymentStatus,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'bookingId': bookingId,
      'paymentMode': paymentMode,
      'paymentStatus': paymentStatus,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentRecordDocumentEquality implements Equality<PaymentRecord> {
  const PaymentRecordDocumentEquality();

  @override
  bool equals(PaymentRecord? e1, PaymentRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.bookingId == e2?.bookingId &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.price == e2?.price;
  }

  @override
  int hash(PaymentRecord? e) => const ListEquality()
      .hash([e?.id, e?.bookingId, e?.paymentMode, e?.paymentStatus, e?.price]);

  @override
  bool isValidKey(Object? o) => o is PaymentRecord;
}
