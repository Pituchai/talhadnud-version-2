//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosTransactionResponse {
  /// Returns a new [DtosTransactionResponse] instance.
  DtosTransactionResponse({
    this.amount,
    this.id,
    this.method,
    this.paymentId,
    this.ref1,
    this.ref2,
    this.ref3,
    this.status,
    this.transactionDate,
    this.transactionId,
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
  String? paymentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ref1;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ref2;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ref3;

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
  String? transactionDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transactionId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosTransactionResponse &&
    other.amount == amount &&
    other.id == id &&
    other.method == method &&
    other.paymentId == paymentId &&
    other.ref1 == ref1 &&
    other.ref2 == ref2 &&
    other.ref3 == ref3 &&
    other.status == status &&
    other.transactionDate == transactionDate &&
    other.transactionId == transactionId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (method == null ? 0 : method!.hashCode) +
    (paymentId == null ? 0 : paymentId!.hashCode) +
    (ref1 == null ? 0 : ref1!.hashCode) +
    (ref2 == null ? 0 : ref2!.hashCode) +
    (ref3 == null ? 0 : ref3!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (transactionDate == null ? 0 : transactionDate!.hashCode) +
    (transactionId == null ? 0 : transactionId!.hashCode);

  @override
  String toString() => 'DtosTransactionResponse[amount=$amount, id=$id, method=$method, paymentId=$paymentId, ref1=$ref1, ref2=$ref2, ref3=$ref3, status=$status, transactionDate=$transactionDate, transactionId=$transactionId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
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
    if (this.paymentId != null) {
      json[r'paymentId'] = this.paymentId;
    } else {
      json[r'paymentId'] = null;
    }
    if (this.ref1 != null) {
      json[r'ref1'] = this.ref1;
    } else {
      json[r'ref1'] = null;
    }
    if (this.ref2 != null) {
      json[r'ref2'] = this.ref2;
    } else {
      json[r'ref2'] = null;
    }
    if (this.ref3 != null) {
      json[r'ref3'] = this.ref3;
    } else {
      json[r'ref3'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.transactionDate != null) {
      json[r'transactionDate'] = this.transactionDate;
    } else {
      json[r'transactionDate'] = null;
    }
    if (this.transactionId != null) {
      json[r'transactionId'] = this.transactionId;
    } else {
      json[r'transactionId'] = null;
    }
    return json;
  }

  /// Returns a new [DtosTransactionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosTransactionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosTransactionResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosTransactionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosTransactionResponse(
        amount: num.parse('${json[r'amount']}'),
        id: mapValueOfType<String>(json, r'id'),
        method: mapValueOfType<String>(json, r'method'),
        paymentId: mapValueOfType<String>(json, r'paymentId'),
        ref1: mapValueOfType<String>(json, r'ref1'),
        ref2: mapValueOfType<String>(json, r'ref2'),
        ref3: mapValueOfType<String>(json, r'ref3'),
        status: mapValueOfType<String>(json, r'status'),
        transactionDate: mapValueOfType<String>(json, r'transactionDate'),
        transactionId: mapValueOfType<String>(json, r'transactionId'),
      );
    }
    return null;
  }

  static List<DtosTransactionResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosTransactionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosTransactionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosTransactionResponse> mapFromJson(dynamic json) {
    final map = <String, DtosTransactionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosTransactionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosTransactionResponse-objects as value to a dart map
  static Map<String, List<DtosTransactionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosTransactionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosTransactionResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

