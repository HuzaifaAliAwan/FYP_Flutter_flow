import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertyRecord extends FirestoreRecord {
  PropertyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

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

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

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

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _propertyOwnerId = snapshotData['propertyOwnerId'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _city = snapshotData['city'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _available = snapshotData['available'] as bool?;
    _photos = getDataList(snapshotData['photos']);
    _extraServices = getDataList(snapshotData['extraServices']);
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
  String? id,
  DocumentReference? propertyOwnerId,
  String? name,
  String? description,
  String? city,
  String? location,
  double? price,
  bool? available,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'propertyOwnerId': propertyOwnerId,
      'name': name,
      'description': description,
      'city': city,
      'location': location,
      'price': price,
      'available': available,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertyRecordDocumentEquality implements Equality<PropertyRecord> {
  const PropertyRecordDocumentEquality();

  @override
  bool equals(PropertyRecord? e1, PropertyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.propertyOwnerId == e2?.propertyOwnerId &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.city == e2?.city &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        e1?.available == e2?.available &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.extraServices, e2?.extraServices);
  }

  @override
  int hash(PropertyRecord? e) => const ListEquality().hash([
        e?.id,
        e?.propertyOwnerId,
        e?.name,
        e?.description,
        e?.city,
        e?.location,
        e?.price,
        e?.available,
        e?.photos,
        e?.extraServices
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertyRecord;
}
