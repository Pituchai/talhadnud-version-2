//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DtosPromptPayResponseData {
  /// Returns a new [DtosPromptPayResponseData] instance.
  DtosPromptPayResponseData({
    this.qrImage,
    this.qrRawData,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? qrImage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? qrRawData;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DtosPromptPayResponseData &&
    other.qrImage == qrImage &&
    other.qrRawData == qrRawData;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (qrImage == null ? 0 : qrImage!.hashCode) +
    (qrRawData == null ? 0 : qrRawData!.hashCode);

  @override
  String toString() => 'DtosPromptPayResponseData[qrImage=$qrImage, qrRawData=$qrRawData]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.qrImage != null) {
      json[r'qrImage'] = this.qrImage;
    } else {
      json[r'qrImage'] = null;
    }
    if (this.qrRawData != null) {
      json[r'qrRawData'] = this.qrRawData;
    } else {
      json[r'qrRawData'] = null;
    }
    return json;
  }

  /// Returns a new [DtosPromptPayResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DtosPromptPayResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DtosPromptPayResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DtosPromptPayResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DtosPromptPayResponseData(
        qrImage: mapValueOfType<String>(json, r'qrImage'),
        qrRawData: mapValueOfType<String>(json, r'qrRawData'),
      );
    }
    return null;
  }

  static List<DtosPromptPayResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DtosPromptPayResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DtosPromptPayResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DtosPromptPayResponseData> mapFromJson(dynamic json) {
    final map = <String, DtosPromptPayResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DtosPromptPayResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DtosPromptPayResponseData-objects as value to a dart map
  static Map<String, List<DtosPromptPayResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DtosPromptPayResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DtosPromptPayResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

