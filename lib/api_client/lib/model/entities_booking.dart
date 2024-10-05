//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntitiesBooking {
  /// Returns a new [EntitiesBooking] instance.
  EntitiesBooking({
    this.bookingDate,
    this.createdAt,
    this.deletedAt,
    this.endDate,
    this.id,
    this.payment,
    this.slot,
    this.slotId,
    this.startDate,
    this.status,
    this.updatedAt,
    this.vendor,
    this.vendorId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? bookingDate;

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
  String? endDate;

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
  EntitiesPayment? payment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  EntitiesSlot? slot;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slotId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startDate;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  EntitiesVendor? vendor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? vendorId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntitiesBooking &&
    other.bookingDate == bookingDate &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.endDate == endDate &&
    other.id == id &&
    other.payment == payment &&
    other.slot == slot &&
    other.slotId == slotId &&
    other.startDate == startDate &&
    other.status == status &&
    other.updatedAt == updatedAt &&
    other.vendor == vendor &&
    other.vendorId == vendorId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bookingDate == null ? 0 : bookingDate!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (payment == null ? 0 : payment!.hashCode) +
    (slot == null ? 0 : slot!.hashCode) +
    (slotId == null ? 0 : slotId!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (vendor == null ? 0 : vendor!.hashCode) +
    (vendorId == null ? 0 : vendorId!.hashCode);

  @override
  String toString() => 'EntitiesBooking[bookingDate=$bookingDate, createdAt=$createdAt, deletedAt=$deletedAt, endDate=$endDate, id=$id, payment=$payment, slot=$slot, slotId=$slotId, startDate=$startDate, status=$status, updatedAt=$updatedAt, vendor=$vendor, vendorId=$vendorId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.bookingDate != null) {
      json[r'booking_date'] = this.bookingDate;
    } else {
      json[r'booking_date'] = null;
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
    if (this.endDate != null) {
      json[r'end_date'] = this.endDate;
    } else {
      json[r'end_date'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.payment != null) {
      json[r'payment'] = this.payment;
    } else {
      json[r'payment'] = null;
    }
    if (this.slot != null) {
      json[r'slot'] = this.slot;
    } else {
      json[r'slot'] = null;
    }
    if (this.slotId != null) {
      json[r'slot_id'] = this.slotId;
    } else {
      json[r'slot_id'] = null;
    }
    if (this.startDate != null) {
      json[r'start_date'] = this.startDate;
    } else {
      json[r'start_date'] = null;
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
    if (this.vendor != null) {
      json[r'vendor'] = this.vendor;
    } else {
      json[r'vendor'] = null;
    }
    if (this.vendorId != null) {
      json[r'vendor_id'] = this.vendorId;
    } else {
      json[r'vendor_id'] = null;
    }
    return json;
  }

  /// Returns a new [EntitiesBooking] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntitiesBooking? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EntitiesBooking[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EntitiesBooking[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EntitiesBooking(
        bookingDate: mapValueOfType<String>(json, r'booking_date'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deletedAt: mapValueOfType<String>(json, r'deleted_at'),
        endDate: mapValueOfType<String>(json, r'end_date'),
        id: mapValueOfType<String>(json, r'id'),
        payment: EntitiesPayment.fromJson(json[r'payment']),
        slot: EntitiesSlot.fromJson(json[r'slot']),
        slotId: mapValueOfType<String>(json, r'slot_id'),
        startDate: mapValueOfType<String>(json, r'start_date'),
        status: mapValueOfType<String>(json, r'status'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
        vendor: EntitiesVendor.fromJson(json[r'vendor']),
        vendorId: mapValueOfType<String>(json, r'vendor_id'),
      );
    }
    return null;
  }

  static List<EntitiesBooking> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntitiesBooking>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntitiesBooking.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntitiesBooking> mapFromJson(dynamic json) {
    final map = <String, EntitiesBooking>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntitiesBooking.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntitiesBooking-objects as value to a dart map
  static Map<String, List<EntitiesBooking>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntitiesBooking>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntitiesBooking.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

