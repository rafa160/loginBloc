import 'dart:async';
import 'dart:convert';

import 'package:for_coworking/feature/home/models/user.dart';
import 'package:for_coworking/routes/sub_routes/authentication_routes.dart';
import 'package:for_coworking/utils/http_tunnel.dart';


/// This class consumes the Url Shortener API
class SignupService {
  // Instantiate our wrapper class for HTTP requests
  HttpTunnel _httpTunnel;

  SignupService(this._httpTunnel);

  /// Fetches a many urls from the database.
  Future<User> signup(String name, email, password) async {
    var authenticationData = json.encode({'name': name, 'email': email, 'password': password});

    final response = await _httpTunnel.post(AuthenticationRoutes.signup(), authenticationData);

    // Create a single Url object
    return User.fromJson(response.data);
  }
}