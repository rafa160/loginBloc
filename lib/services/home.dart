import 'dart:async';

import 'package:for_coworking/feature/home/models/home.dart';
import 'package:for_coworking/routes/sub_routes/home_routes.dart';
import 'package:for_coworking/utils/http_tunnel.dart';


/// This class consumes the Url Shortener API
class HomeService {
  // Instantiate our wrapper class for HTTP requests
  HttpTunnel _httpTunnel;

  HomeService(this._httpTunnel);

  /// Fetches a many urls from the database.
  Future<Home> requestHome() async {
    final response = await _httpTunnel.get(HomeRoutes.myHome());

    // Create a single Url object
    return Home.fromJson(response.data);
  }
}
