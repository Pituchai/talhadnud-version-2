import 'package:http/src/response.dart';
import 'package:talhadnad/api_client/lib/api.dart';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:talhadnad/model/market.dart';
import 'package:talhadnad/model/slot.dart';

class ApiService {
  static final ApiClient _apiClient = ApiClient();

  static void setAuthToken(String token) {
    _apiClient.addDefaultHeader('Authorization', 'Bearer $token');
  }

  static UsersApi get usersApi => UsersApi(_apiClient);
}

class UserModel extends ChangeNotifier {
  String vendorId = "";
  String accessToken = "";
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  DtosRegisterResponse? registerResponse;
  UserModel() {
    loadUserData();
  }

  // Load user data from SharedPreferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token') ?? '';
    vendorId = prefs.getString('vendor_id') ?? '';

    if (accessToken.isNotEmpty) {
      ApiService.setAuthToken(accessToken);
    }

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> getUserData() async {
    if (accessToken.isEmpty) {
      if (kDebugMode) {
        print('Access token is missing');
      }
      return;
    }

    try {
      var res = await ApiService.usersApi.usersIdGetWithHttpInfo(vendorId);

      var userData = jsonDecode(res.body);

      userData.forEach((key, value) {
        if (kDebugMode) {
          print("$key: $value");
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error in getUserData: $e');
      }
      rethrow;
    }
  }

  //get slot by id
  // Future<Slot> getSlotById(String id) async {
  //   try {
  //     var res = await SlotsApi().slotsGetIdGetWithHttpInfo(id);
  //     var jsonResponse = jsonDecode(res.body);

  //     if (jsonResponse['status'] == 'success') {
  //       return Slot.fromJson(jsonResponse['data']);
  //     } else {
  //       throw Exception('Failed to fetch slot: ${jsonResponse['message']}');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error in getSlotById: $e');
  //     }
  //     rethrow;
  //   }
  // }

  Future<Market> getMarketById(String id) async {
    try {
      var res = await MarketApi().marketsGetIdGetWithHttpInfo(id);
      var jsonResponse = jsonDecode(res.body);

      if (jsonResponse['status'] == 'success') {
        return Market.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to fetch market: ${jsonResponse['message']}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in getMarketById: $e');
      }
      rethrow;
    }
  }

  //get all markets
  Future<List<Market>> getAllMarkets() async {
    try {
      var res = await MarketApi().marketsGetGetWithHttpInfo();
      var jsonResponse = jsonDecode(res.body);

      if (jsonResponse['status'] == 'success') {
        List<dynamic> marketsList = jsonResponse['data'];
        return marketsList
            .map((marketJson) => Market.fromJson(marketJson))
            .toList();
      } else {
        throw Exception('Failed to fetch markets: ${jsonResponse['message']}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in getAllMarkets: $e');
      }
      rethrow;
    }
  }

  //register user
  Future<Response> registerUser(DtosRegisterRequest registerRequest) async {
    try {
      Response registerResponse =
          await AuthApi().authRegisterPostWithHttpInfo(registerRequest);

      print(registerResponse.body);

      if (registerResponse != null) {
        if (kDebugMode) {
          print('User registered successfully: ${registerResponse.toString()}');
        }
      } else {
        if (kDebugMode) {
          print('Received null response from registration API.');
        }
      }

      return registerResponse; // Return the response if available
    } catch (e) {
      if (e is ApiException) {
        if (kDebugMode) {
          print('Failed to register user with error: ${e.message}');
        }
      } else {
        if (kDebugMode) {
          print('Error in registerUser: $e');
        }
      }
      rethrow; // Optionally rethrow if you want to propagate the error further
    }
  }

  // Getter to check if user is logged in
  bool get isLogged => accessToken.isNotEmpty;

  // Method to login the user
  Future<void> login(String username, String password) async {
    final api = AuthApi();
    final loginRequest =
        EntitiesLoginRequest(password: password, usernameOrEmail: username);

    try {
      var res = await api.authLoginPostWithHttpInfo(loginRequest);

      if (res.statusCode == 200) {
        final Map<String, dynamic> userData = jsonDecode(res.body);
        vendorId = userData['vendor_id'] ?? '';
        accessToken = userData['access_token'] ?? '';

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', accessToken);
        await prefs.setString('vendor_id', vendorId);

        // Set the auth token globally
        ApiService.setAuthToken(accessToken);

        await getUserData();

        if (kDebugMode) {
          print('Login successful');
        }
      } else {
        if (kDebugMode) {
          print('Login failed with status code: ${res.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
    }

    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('vendor_id');
    accessToken = "";
    vendorId = "";
    notifyListeners();
  }
}
