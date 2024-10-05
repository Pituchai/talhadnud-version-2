//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosBookingRequest {
  /// Returns a new [DtosBookingRequest] instance.
  DtosBookingRequest({
    required this.amount,
    required this.endDate,
    required this.marketId,
    required this.method,
    required this.slotId,
    required this.startDate,
    required this.vendorId,
  });

  /// Required, amount to be paid
  num amount;

  /// Required, end of booking
  String endDate;

  /// Required, selected by the user
  String marketId;

  /// Required, payment method
  String method;

  /// Required, selected by the user
  String slotId;

  /// Required, start of booking
  String startDate;

  /// Required, selected by the user
  String vendorId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosBookingRequest &&
    other.amount == amount &&
    other.endDate == endDate &&
    other.marketId == marketId &&
    other.method == method &&
    other.slotId == slotId &&
    other.startDate == startDate &&
    other.vendorId == vendorId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount.hashCode) +
    (endDate.hashCode) +
    (marketId.hashCode) +
    (method.hashCode) +
    (slotId.hashCode) +
    (startDate.hashCode) +
    (vendorId.hashCode);

  @override
  String toString() => 'DtosBookingRequest[amount=$amount, endDate=$endDate, marketId=$marketId, method=$method, slotId=$slotId, startDate=$startDate, vendorId=$vendorId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'amount'] = this.amount;
      json[r'end_date'] = this.endDate;
      json[r'market_id'] = this.marketId;
      json[r'method'] = this.method;
      json[r'slot_id'] = this.slotId;
      json[r'start_date'] = this.startDate;
      json[r'vendor_id'] = this.vendorId;
    return json;
  }

  /// Returns a new [DtosBookingRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosBookingRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosBookingRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosBookingRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosBookingRequest(
        amount: num.parse('${json[r'amount']}'),
        endDate: mapValueOfType<String>(json, r'end_date')!,
        marketId: mapValueOfType<String>(json, r'market_id')!,
        method: mapValueOfType<String>(json, r'method')!,
        slotId: mapValueOfType<String>(json, r'slot_id')!,
        startDate: mapValueOfType<String>(json, r'start_date')!,
        vendorId: mapValueOfType<String>(json, r'vendor_id')!,
      );
    }
    return null;
  }

  static List<DtosBookingRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosBookingRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosBookingRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosBookingRequest> mapFromJson(dynamic json) {
    final map = <String, DtosBookingRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosBookingRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosBookingRequest-objects as value to a dart map
  static Map<String, List<DtosBookingRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosBookingRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosBookingRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'amount',
    'end_date',
    'market_id',
    'method',
    'slot_id',
    'start_date',
    'vendor_id',
  };
}

