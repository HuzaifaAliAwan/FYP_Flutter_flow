import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertyRecord extends FirestoreRecord {
  PropertyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "extraServices" field.
  List<DocumentReference>? _extraServices;
  List<DocumentReference> get extraServices => _extraServices ?? const [];
  bool hasExtraServices() => _extraServices != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  bool hasPhotos() => _photos != null;

  // "approvalStatus" field.
  PropertyApprovalType? _approvalStatus;
  PropertyApprovalType? get approvalStatus => _approvalStatus;
  bool hasApprovalStatus() => _approvalStatus != null;

  // "ebillPic" field.
  String? _ebillPic;
  String get ebillPic => _ebillPic ?? '';
  bool hasEbillPic() => _ebillPic != null;

  // "cityLocation" field.
  String? _cityLocation;
  String get cityLocation => _cityLocation ?? '';
  bool hasCityLocation() => _cityLocation != null;

  // "AttachedBath" field.
  bool? _attachedBath;
  bool get attachedBath => _attachedBath ?? false;
  bool hasAttachedBath() => _attachedBath != null;

  // "wifi" field.
  bool? _wifi;
  bool get wifi => _wifi ?? false;
  bool hasWifi() => _wifi != null;

  // "AC" field.
  bool? _ac;
  bool get ac => _ac ?? false;
  bool hasAc() => _ac != null;

  // "Parking" field.
  bool? _parking;
  bool get parking => _parking ?? false;
  bool hasParking() => _parking != null;

  // "publicTransportAccessible" field.
  bool? _publicTransportAccessible;
  bool get publicTransportAccessible => _publicTransportAccessible ?? false;
  bool hasPublicTransportAccessible() => _publicTransportAccessible != null;

  // "groceryStores" field.
  bool? _groceryStores;
  bool get groceryStores => _groceryStores ?? false;
  bool hasGroceryStores() => _groceryStores != null;

  // "restaurants" field.
  bool? _restaurants;
  bool get restaurants => _restaurants ?? false;
  bool hasRestaurants() => _restaurants != null;

  // "Hospital" field.
  bool? _hospital;
  bool get hospital => _hospital ?? false;
  bool hasHospital() => _hospital != null;

  // "touristAttractions" field.
  bool? _touristAttractions;
  bool get touristAttractions => _touristAttractions ?? false;
  bool hasTouristAttractions() => _touristAttractions != null;

  // "season" field.
  String? _season;
  String get season => _season ?? '';
  bool hasSeason() => _season != null;

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  bool hasLatlong() => _latlong != null;

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _propertyOwnerId = snapshotData['propertyOwnerId'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _available = snapshotData['available'] as bool?;
    _extraServices = getDataList(snapshotData['extraServices']);
    _address = snapshotData['address'] as String?;
    _photos = snapshotData['photos'] as String?;
    _approvalStatus = snapshotData['approvalStatus'] is PropertyApprovalType
        ? snapshotData['approvalStatus']
        : deserializeEnum<PropertyApprovalType>(snapshotData['approvalStatus']);
    _ebillPic = snapshotData['ebillPic'] as String?;
    _cityLocation = snapshotData['cityLocation'] as String?;
    _attachedBath = snapshotData['AttachedBath'] as bool?;
    _wifi = snapshotData['wifi'] as bool?;
    _ac = snapshotData['AC'] as bool?;
    _parking = snapshotData['Parking'] as bool?;
    _publicTransportAccessible =
        snapshotData['publicTransportAccessible'] as bool?;
    _groceryStores = snapshotData['groceryStores'] as bool?;
    _restaurants = snapshotData['restaurants'] as bool?;
    _hospital = snapshotData['Hospital'] as bool?;
    _touristAttractions = snapshotData['touristAttractions'] as bool?;
    _season = snapshotData['season'] as String?;
    _latlong = snapshotData['latlong'] as LatLng?;
    _rating = snapshotData['rating'] as String?;
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
  String? photos,
  PropertyApprovalType? approvalStatus,
  String? ebillPic,
  String? cityLocation,
  bool? attachedBath,
  bool? wifi,
  bool? ac,
  bool? parking,
  bool? publicTransportAccessible,
  bool? groceryStores,
  bool? restaurants,
  bool? hospital,
  bool? touristAttractions,
  String? season,
  LatLng? latlong,
  String? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propertyOwnerId': propertyOwnerId,
      'name': name,
      'description': description,
      'price': price,
      'available': available,
      'address': address,
      'photos': photos,
      'approvalStatus': approvalStatus,
      'ebillPic': ebillPic,
      'cityLocation': cityLocation,
      'AttachedBath': attachedBath,
      'wifi': wifi,
      'AC': ac,
      'Parking': parking,
      'publicTransportAccessible': publicTransportAccessible,
      'groceryStores': groceryStores,
      'restaurants': restaurants,
      'Hospital': hospital,
      'touristAttractions': touristAttractions,
      'season': season,
      'latlong': latlong,
      'rating': rating,
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
        listEquality.equals(e1?.extraServices, e2?.extraServices) &&
        e1?.address == e2?.address &&
        e1?.photos == e2?.photos &&
        e1?.approvalStatus == e2?.approvalStatus &&
        e1?.ebillPic == e2?.ebillPic &&
        e1?.cityLocation == e2?.cityLocation &&
        e1?.attachedBath == e2?.attachedBath &&
        e1?.wifi == e2?.wifi &&
        e1?.ac == e2?.ac &&
        e1?.parking == e2?.parking &&
        e1?.publicTransportAccessible == e2?.publicTransportAccessible &&
        e1?.groceryStores == e2?.groceryStores &&
        e1?.restaurants == e2?.restaurants &&
        e1?.hospital == e2?.hospital &&
        e1?.touristAttractions == e2?.touristAttractions &&
        e1?.season == e2?.season &&
        e1?.latlong == e2?.latlong &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(PropertyRecord? e) => const ListEquality().hash([
        e?.propertyOwnerId,
        e?.name,
        e?.description,
        e?.price,
        e?.available,
        e?.extraServices,
        e?.address,
        e?.photos,
        e?.approvalStatus,
        e?.ebillPic,
        e?.cityLocation,
        e?.attachedBath,
        e?.wifi,
        e?.ac,
        e?.parking,
        e?.publicTransportAccessible,
        e?.groceryStores,
        e?.restaurants,
        e?.hospital,
        e?.touristAttractions,
        e?.season,
        e?.latlong,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertyRecord;
}
