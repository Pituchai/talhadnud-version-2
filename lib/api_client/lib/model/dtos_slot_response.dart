//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosSlotResponse {
  /// Returns a new [DtosSlotResponse] instance.
  DtosSlotResponse({
    this.description,
    this.endTime,
    this.id,
    this.marketId,
    this.name,
    this.price,
    this.size,
    this.slotType,
    this.startTime,
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? marketId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? size;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slotType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosSlotResponse &&
    other.description == description &&
    other.endTime == endTime &&
    other.id == id &&
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
    (endTime == null ? 0 : endTime!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (marketId == null ? 0 : marketId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (slotType == null ? 0 : slotType!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'DtosSlotResponse[description=$description, endTime=$endTime, id=$id, marketId=$marketId, name=$name, price=$price, size=$size, slotType=$slotType, startTime=$startTime, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.endTime != null) {
      json[r'end_time'] = this.endTime;
    } else {
      json[r'end_time'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.marketId != null) {
      json[r'market_id'] = this.marketId;
    } else {
      json[r'market_id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    if (this.slotType != null) {
      json[r'slot_type'] = this.slotType;
    } else {
      json[r'slot_type'] = null;
    }
    if (this.startTime != null) {
      json[r'start_time'] = this.startTime;
    } else {
      json[r'start_time'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [DtosSlotResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosSlotResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosSlotResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosSlotResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosSlotResponse(
        description: mapValueOfType<String>(json, r'description'),
        endTime: mapValueOfType<String>(json, r'end_time'),
        id: mapValueOfType<String>(json, r'id'),
        marketId: mapValueOfType<String>(json, r'market_id'),
        name: mapValueOfType<String>(json, r'name'),
        price: num.parse('${json[r'price']}'),
        size: mapValueOfType<String>(json, r'size'),
        slotType: mapValueOfType<String>(json, r'slot_type'),
        startTime: mapValueOfType<String>(json, r'start_time'),
        status: mapValueOfType<String>(json, r'status'),
      );
    }
    return null;
  }

  static List<DtosSlotResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosSlotResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosSlotResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosSlotResponse> mapFromJson(dynamic json) {
    final map = <String, DtosSlotResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosSlotResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosSlotResponse-objects as value to a dart map
  static Map<String, List<DtosSlotResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosSlotResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosSlotResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

