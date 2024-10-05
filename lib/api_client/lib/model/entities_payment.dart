//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntitiesPayment {
  /// Returns a new [EntitiesPayment] instance.
  EntitiesPayment({
    this.amount,
    this.booking,
    this.bookingId,
    this.createdAt,
    this.deletedAt,
    this.id,
    this.method,
    this.paymentDate,
    this.status,
    this.transactions = const [],
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  EntitiesBooking? booking;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? bookingId;

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
  String? method;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? paymentDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  List<EntitiesTransaction> transactions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntitiesPayment &&
    other.amount == amount &&
    other.booking == booking &&
    other.bookingId == bookingId &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.id == id &&
    other.method == method &&
    other.paymentDate == paymentDate &&
    other.status == status &&
    _deepEquality.equals(other.transactions, transactions) &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (booking == null ? 0 : booking!.hashCode) +
    (bookingId == null ? 0 : bookingId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (method == null ? 0 : method!.hashCode) +
    (paymentDate == null ? 0 : paymentDate!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (transactions.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'EntitiesPayment[amount=$amount, booking=$booking, bookingId=$bookingId, createdAt=$createdAt, deletedAt=$deletedAt, id=$id, method=$method, paymentDate=$paymentDate, status=$status, transactions=$transactions, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.booking != null) {
      json[r'booking'] = this.booking;
    } else {
      json[r'booking'] = null;
    }
    if (this.bookingId != null) {
      json[r'booking_id'] = this.bookingId;
    } else {
      json[r'booking_id'] = null;
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
    if (this.method != null) {
      json[r'method'] = this.method;
    } else {
      json[r'method'] = null;
    }
    if (this.paymentDate != null) {
      json[r'payment_date'] = this.paymentDate;
    } else {
      json[r'payment_date'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
      json[r'transactions'] = this.transactions;
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [EntitiesPayment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntitiesPayment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EntitiesPayment[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EntitiesPayment[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EntitiesPayment(
        amount: num.parse('${json[r'amount']}'),
        booking: EntitiesBooking.fromJson(json[r'booking']),
        bookingId: mapValueOfType<String>(json, r'booking_id'),
        createdAt: mapValueOfType<String>(json, r'created_at'),
        deletedAt: mapValueOfType<String>(json, r'deleted_at'),
        id: mapValueOfType<String>(json, r'id'),
        method: mapValueOfType<String>(json, r'method'),
        paymentDate: mapValueOfType<String>(json, r'payment_date'),
        status: mapValueOfType<String>(json, r'status'),
        transactions: EntitiesTransaction.listFromJson(json[r'transactions']),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<EntitiesPayment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntitiesPayment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntitiesPayment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntitiesPayment> mapFromJson(dynamic json) {
    final map = <String, EntitiesPayment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntitiesPayment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntitiesPayment-objects as value to a dart map
  static Map<String, List<EntitiesPayment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntitiesPayment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntitiesPayment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

