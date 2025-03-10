import 'package:collection/collection.dart';

enum UserType {
  propertyOwner,
  customer,
}

enum PropertyApprovalType {
  approved,
  pending,
  rejected,
}

enum Seasons {
  summer,
  winter,
  autumn,
  spring,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserType):
      return UserType.values.deserialize(value) as T?;
    case (PropertyApprovalType):
      return PropertyApprovalType.values.deserialize(value) as T?;
    case (Seasons):
      return Seasons.values.deserialize(value) as T?;
    default:
      return null;
  }
}
