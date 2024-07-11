
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:module_home/home_screen.dart';

class HomeModule extends Module {

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => HomeScreen());
  }
}
