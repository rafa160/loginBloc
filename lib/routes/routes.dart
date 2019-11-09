class Routes {
  static const rootUrl = "https://coworking-bk.herokuapp.com";
  static const baseNamespace = "/api";
  static const baseApiVersion = "/v1";

  static buildRoute(String customRoute) {
    return "$rootUrl$baseNamespace$baseApiVersion$customRoute";
  }
}