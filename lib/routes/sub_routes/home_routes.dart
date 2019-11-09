import '../routes.dart';

class HomeRoutes extends Routes {
  static const homeNameSpace = "/home";

  static myHome(){
    return Routes.buildRoute(homeNameSpace);
  }

}