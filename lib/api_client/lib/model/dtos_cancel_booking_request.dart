//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosCancelBookingRequest {
  /// Returns a new [DtosCancelBookingRequest] instance.
  DtosCancelBookingRequest({
    required this.bookingId,
    this.userId,
  });

  /// The ID of the booking to be canceled.
  String bookingId;

  /// Optional: The ID of the user requesting the cancellation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosCancelBookingRequest &&
    other.bookingId == bookingId &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bookingId.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'DtosCancelBookingRequest[bookingId=$bookingId, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'booking_id'] = this.bookingId;
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    return json;
  }

  /// Returns a new [DtosCancelBookingRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosCancelBookingRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosCancelBookingRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosCancelBookingRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosCancelBookingRequest(
        bookingId: mapValueOfType<String>(json, r'booking_id')!,
        userId: mapValueOfType<String>(json, r'user_id'),
      );
    }
    return null;
  }

  static List<DtosCancelBookingRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosCancelBookingRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosCancelBookingRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosCancelBookingRequest> mapFromJson(dynamic json) {
    final map = <String, DtosCancelBookingRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosCancelBookingRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosCancelBookingRequest-objects as value to a dart map
  static Map<String, List<DtosCancelBookingRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosCancelBookingRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosCancelBookingRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'booking_id',
  };
}

