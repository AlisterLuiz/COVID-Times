import 'package:mobile_app/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  // static const String splash = '/splash';
  static const String navigation = '/navigation';
  static const String welcome = '/welcome';

  static final routes = <String, WidgetBuilder>{
    navigation: (BuildContext context) => NavigationBar(),
    welcome: (BuildContext context) => WelcomePage(),
  };
}
