import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationsRecord extends FirestoreRecord {
  ConversationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customerRef" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  // "propertyOwnerRef" field.
  DocumentReference? _propertyOwnerRef;
  DocumentReference? get propertyOwnerRef => _propertyOwnerRef;
  bool hasPropertyOwnerRef() => _propertyOwnerRef != null;

  // "totalMessages" field.
  int? _totalMessages;
  int get totalMessages => _totalMessages ?? 0;
  bool hasTotalMessages() => _totalMessages != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "newMessagesForCustomer" field.
  int? _newMessagesForCustomer;
  int get newMessagesForCustomer => _newMessagesForCustomer ?? 0;
  bool hasNewMessagesForCustomer() => _newMessagesForCustomer != null;

  // "newMessagesForPropertyOwner" field.
  int? _newMessagesForPropertyOwner;
  int get newMessagesForPropertyOwner => _newMessagesForPropertyOwner ?? 0;
  bool hasNewMessagesForPropertyOwner() => _newMessagesForPropertyOwner != null;

  void _initializeFields() {
    _customerRef = snapshotData['customerRef'] as DocumentReference?;
    _propertyOwnerRef = snapshotData['propertyOwnerRef'] as DocumentReference?;
    _totalMessages = castToType<int>(snapshotData['totalMessages']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _newMessagesForCustomer =
        castToType<int>(snapshotData['newMessagesForCustomer']);
    _newMessagesForPropertyOwner =
        castToType<int>(snapshotData['newMessagesForPropertyOwner']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationsRecord.fromSnapshot(s));

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationsRecord.fromSnapshot(s));

  static ConversationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversationsRecordData({
  DocumentReference? customerRef,
  DocumentReference? propertyOwnerRef,
  int? totalMessages,
  String? lastMessage,
  int? newMessagesForCustomer,
  int? newMessagesForPropertyOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customerRef': customerRef,
      'propertyOwnerRef': propertyOwnerRef,
      'totalMessages': totalMessages,
      'lastMessage': lastMessage,
      'newMessagesForCustomer': newMessagesForCustomer,
      'newMessagesForPropertyOwner': newMessagesForPropertyOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationsRecordDocumentEquality
    implements Equality<ConversationsRecord> {
  const ConversationsRecordDocumentEquality();

  @override
  bool equals(ConversationsRecord? e1, ConversationsRecord? e2) {
    return e1?.customerRef == e2?.customerRef &&
        e1?.propertyOwnerRef == e2?.propertyOwnerRef &&
        e1?.totalMessages == e2?.totalMessages &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.newMessagesForCustomer == e2?.newMessagesForCustomer &&
        e1?.newMessagesForPropertyOwner == e2?.newMessagesForPropertyOwner;
  }

  @override
  int hash(ConversationsRecord? e) => const ListEquality().hash([
        e?.customerRef,
        e?.propertyOwnerRef,
        e?.totalMessages,
        e?.lastMessage,
        e?.newMessagesForCustomer,
        e?.newMessagesForPropertyOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is ConversationsRecord;
}
