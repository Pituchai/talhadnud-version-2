//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosSlotRequest {
  /// Returns a new [DtosSlotRequest] instance.
  DtosSlotRequest({
    this.description,
    required this.endTime,
    required this.marketId,
    required this.name,
    required this.price,
    required this.size,
    this.slotType,
    required this.startTime,
    required this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  String endTime;

  String marketId;

  String name;

  num price;

  String size;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slotType;

  String startTime;

  String status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosSlotRequest &&
    other.description == description &&
    other.endTime == endTime &&
    other.marketId == marketId &&
    other.name == name &&
    other.price == price &&
    other.size == size &&
    other.slotType == slotType &&
    other.startTime == startTime &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (endTime.hashCode) +
    (marketId.hashCode) +
    (name.hashCode) +
    (price.hashCode) +
    (size.hashCode) +
    (slotType == null ? 0 : slotType!.hashCode) +
    (startTime.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'DtosSlotRequest[description=$description, endTime=$endTime, marketId=$marketId, name=$name, price=$price, size=$size, slotType=$slotType, startTime=$startTime, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'end_time'] = this.endTime;
      json[r'market_id'] = this.marketId;
      json[r'name'] = this.name;
      json[r'price'] = this.price;
      json[r'size'] = this.size;
    if (this.slotType != null) {
      json[r'slot_type'] = this.slotType;
    } else {
      json[r'slot_type'] = null;
    }
      json[r'start_time'] = this.startTime;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [DtosSlotRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosSlotRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosSlotRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosSlotRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosSlotRequest(
        description: mapValueOfType<String>(json, r'description'),
        endTime: mapValueOfType<String>(json, r'end_time')!,
        marketId: mapValueOfType<String>(json, r'market_id')!,
        name: mapValueOfType<String>(json, r'name')!,
        price: num.parse('${json[r'price']}'),
        size: mapValueOfType<String>(json, r'size')!,
        slotType: mapValueOfType<String>(json, r'slot_type'),
        startTime: mapValueOfType<String>(json, r'start_time')!,
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<DtosSlotRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosSlotRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosSlotRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosSlotRequest> mapFromJson(dynamic json) {
    final map = <String, DtosSlotRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosSlotRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosSlotRequest-objects as value to a dart map
  static Map<String, List<DtosSlotRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosSlotRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosSlotRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'end_time',
    'market_id',
    'name',
    'price',
    'size',
    'start_time',
    'status',
  };
}

