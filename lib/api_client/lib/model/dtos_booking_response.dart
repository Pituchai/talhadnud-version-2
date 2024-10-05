//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosBookingResponse {
  /// Returns a new [DtosBookingResponse] instance.
  DtosBookingResponse({
    this.amount,
    this.bookingDate,
    this.endDate,
    this.id,
    this.method,
    this.promptPay,
    this.slotId,
    this.startDate,
    this.status,
    this.transaction,
    this.vendorId,
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
  String? bookingDate;

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
  String? method;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DtosPromptPayResponse? promptPay;

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
  DtosTransactionResponse? transaction;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? vendorId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosBookingResponse &&
    other.amount == amount &&
    other.bookingDate == bookingDate &&
    other.endDate == endDate &&
    other.id == id &&
    other.method == method &&
    other.promptPay == promptPay &&
    other.slotId == slotId &&
    other.startDate == startDate &&
    other.status == status &&
    other.transaction == transaction &&
    other.vendorId == vendorId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (bookingDate == null ? 0 : bookingDate!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (method == null ? 0 : method!.hashCode) +
    (promptPay == null ? 0 : promptPay!.hashCode) +
    (slotId == null ? 0 : slotId!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (transaction == null ? 0 : transaction!.hashCode) +
    (vendorId == null ? 0 : vendorId!.hashCode);

  @override
  String toString() => 'DtosBookingResponse[amount=$amount, bookingDate=$bookingDate, endDate=$endDate, id=$id, method=$method, promptPay=$promptPay, slotId=$slotId, startDate=$startDate, status=$status, transaction=$transaction, vendorId=$vendorId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.bookingDate != null) {
      json[r'bookingDate'] = this.bookingDate;
    } else {
      json[r'bookingDate'] = null;
    }
    if (this.endDate != null) {
      json[r'endDate'] = this.endDate;
    } else {
      json[r'endDate'] = null;
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
    if (this.promptPay != null) {
      json[r'promptPay'] = this.promptPay;
    } else {
      json[r'promptPay'] = null;
    }
    if (this.slotId != null) {
      json[r'slotId'] = this.slotId;
    } else {
      json[r'slotId'] = null;
    }
    if (this.startDate != null) {
      json[r'startDate'] = this.startDate;
    } else {
      json[r'startDate'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.transaction != null) {
      json[r'transaction'] = this.transaction;
    } else {
      json[r'transaction'] = null;
    }
    if (this.vendorId != null) {
      json[r'vendorId'] = this.vendorId;
    } else {
      json[r'vendorId'] = null;
    }
    return json;
  }

  /// Returns a new [DtosBookingResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosBookingResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosBookingResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosBookingResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosBookingResponse(
        amount: num.parse('${json[r'amount']}'),
        bookingDate: mapValueOfType<String>(json, r'bookingDate'),
        endDate: mapValueOfType<String>(json, r'endDate'),
        id: mapValueOfType<String>(json, r'id'),
        method: mapValueOfType<String>(json, r'method'),
        promptPay: DtosPromptPayResponse.fromJson(json[r'promptPay']),
        slotId: mapValueOfType<String>(json, r'slotId'),
        startDate: mapValueOfType<String>(json, r'startDate'),
        status: mapValueOfType<String>(json, r'status'),
        transaction: DtosTransactionResponse.fromJson(json[r'transaction']),
        vendorId: mapValueOfType<String>(json, r'vendorId'),
      );
    }
    return null;
  }

  static List<DtosBookingResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosBookingResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosBookingResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosBookingResponse> mapFromJson(dynamic json) {
    final map = <String, DtosBookingResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosBookingResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosBookingResponse-objects as value to a dart map
  static Map<String, List<DtosBookingResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosBookingResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosBookingResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

