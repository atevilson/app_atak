
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_home/home_screen.dart';


class AppModule extends Module {


  @override
  void routes(RouteManager r) {
    r.child('/', child: (args) => HomeScreen());
  }
}