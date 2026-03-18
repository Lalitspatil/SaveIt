import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:saveit/pages/home/home_controller.dart';
import 'package:saveit/resources/base_model.dart';

class Providers{
  static List<SingleChildWidget> providerList = [
       ChangeNotifierProvider(create: (_) => BaseModel()),
       //ChangeNotifierProvider(create: (_) => NavigationController()),
      // ChangeNotifierProvider(create: (_) => SplashController()..init('splash')),
       ChangeNotifierProvider(create: (_) => HomeController()..init('home')),
       
  ];
}