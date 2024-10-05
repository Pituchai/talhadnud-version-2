//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntitiesSlot {
  /// Returns a new [EntitiesSlot] instance.
  EntitiesSlot({
    this.bookings = const [],
    this.column,
    this.createdAt,
    this.deletedAt,
    this.id,
    this.market,
    this.marketId,
    this.name,
    this.price,
    this.row,
    this.size,
    this.slotType,
    this.status,
    this.updatedAt,
  });

  List<EntitiesBooking> bookings;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? column;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deletedAt;

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
  EntitiesMarket? market;

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
  int? row;

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
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntitiesSlot &&
    _deepEquality.equals(other.bookings, bookings) &&
    other.column == column &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.id == id &&
    other.market == market &&
    other.marketId == marketId &&
    other.name == name &&
    other.price == price &&
    other.row == row &&
    other.size == size &&
    other.slotType == slotType &&
    other.status == status &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bookings.hashCode) +
    (column == null ? 0 : column!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (market == null ? 0 : market!.hashCode) +
    (marketId == null ? 0 : marketId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (row == null ? 0 : row!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (slotType == null ? 0 : slotType!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'EntitiesSlot[bookings=$bookings, column=$column, createdAt=$createdAt, deletedAt=$deletedAt, id=$id, market=$market, marketId=$marketId, name=$name, price=$price, row=$row, size=$size, slotType=$slotType, status=$status, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bookings'] = this.bookings;
    if (this.column != null) {
      json[r'column'] = this.column;
    } else {
      json[r'column'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.deletedAt != null) {
      json[r'deleted_at'] = this.deletedAt;
    } else {
      json[r'deleted_at'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.market != null) {
      json[r'market'] = this.market;
    } else {
      json[r'market'] = null;
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
    if (this.row != null) {
      json[r'row'] = this.row;
    } else {
      json[r'row'] = null;
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
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [EntitiesSlot] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntitiesSlot? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EntitiesSlot[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EntitiesSlot[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EntitiesSlot(
        bookings: EntitiesBooking.listFromJson(json[r'bookings']),
        column: mapValueOfType<int>(json, r'column'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deletedAt: mapValueOfType<String>(json, r'deleted_at'),
        id: mapValueOfType<String>(json, r'id'),
        market: EntitiesMarket.fromJson(json[r'market']),
        marketId: mapValueOfType<String>(json, r'market_id'),
        name: mapValueOfType<String>(json, r'name'),
        price: num.parse('${json[r'price']}'),
        row: mapValueOfType<int>(json, r'row'),
        size: mapValueOfType<String>(json, r'size'),
        slotType: mapValueOfType<String>(json, r'slot_type'),
        status: mapValueOfType<String>(json, r'status'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<EntitiesSlot> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntitiesSlot>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntitiesSlot.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntitiesSlot> mapFromJson(dynamic json) {
    final map = <String, EntitiesSlot>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntitiesSlot.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntitiesSlot-objects as value to a dart map
  static Map<String, List<EntitiesSlot>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntitiesSlot>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntitiesSlot.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

