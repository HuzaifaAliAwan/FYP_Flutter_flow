import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertyRecord extends FirestoreRecord {
  PropertyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propertyOwnerId" field.
  DocumentReference? _propertyOwnerId;
  DocumentReference? get propertyOwnerId => _propertyOwnerId;
  bool hasPropertyOwnerId() => _propertyOwnerId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "extraServices" field.
  List<DocumentReference>? _extraServices;
  List<DocumentReference> get extraServices => _extraServices ?? const [];
  bool hasExtraServices() => _extraServices != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _propertyOwnerId = snapshotData['propertyOwnerId'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _available = snapshotData['available'] as bool?;
    _photos = getDataList(snapshotData['photos']);
    _extraServices = getDataList(snapshotData['extraServices']);
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('property');

  static Stream<PropertyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertyRecord.fromSnapshot(s));

  static Future<PropertyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertyRecord.fromSnapshot(s));

  static PropertyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertyRecordData({
  DocumentReference? propertyOwnerId,
  String? name,
  String? description,
  double? price,
  bool? available,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyOwnerId': propertyOwnerId,
      'name': name,
      'description': description,
      'price': price,
      'available': available,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertyRecordDocumentEquality implements Equality<PropertyRecord> {
  const PropertyRecordDocumentEquality();

  @override
  bool equals(PropertyRecord? e1, PropertyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.propertyOwnerId == e2?.propertyOwnerId &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.available == e2?.available &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.extraServices, e2?.extraServices) &&
        e1?.address == e2?.address;
  }

  @override
  int hash(PropertyRecord? e) => const ListEquality().hash([
        e?.propertyOwnerId,
        e?.name,
        e?.description,
        e?.price,
        e?.available,
        e?.photos,
        e?.extraServices,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertyRecord;
}
