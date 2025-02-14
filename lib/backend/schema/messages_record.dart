import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timeData" field.
  DateTime? _timeData;
  DateTime? get timeData => _timeData;
  bool hasTimeData() => _timeData != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "sender" field.
  UserType? _sender;
  UserType? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  UserType? _receiver;
  UserType? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeData = snapshotData['timeData'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _sender = snapshotData['sender'] is UserType
        ? snapshotData['sender']
        : deserializeEnum<UserType>(snapshotData['sender']);
    _receiver = snapshotData['receiver'] is UserType
        ? snapshotData['receiver']
        : deserializeEnum<UserType>(snapshotData['receiver']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? timeData,
  String? content,
  UserType? sender,
  UserType? receiver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timeData': timeData,
      'content': content,
      'sender': sender,
      'receiver': receiver,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.timeData == e2?.timeData &&
        e1?.content == e2?.content &&
        e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality()
      .hash([e?.timeData, e?.content, e?.sender, e?.receiver]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
