
import 'package:flutter/material.dart';
import 'package:saveit/navigation/routes.dart';
import 'package:saveit/resources/assets.dart';
import 'package:saveit/resources/base_model.dart';

class NavigationController extends BaseModel {

    NavigationController(){
      Future.microtask(() async {
        await init('bottom');
        createBottomMenu();
      });
    }

    Map<String, List<String>> bottomMenus = {};
    
    createBottomMenu(){
      bottomMenus = {
        getValue('home'): [Assets.home, Routes.home],
        getValue('download'): [Assets.downloadIcon, Routes.home],
        getValue('setting'): [Assets.setting, Routes.home],
      };
      notifyListeners();
    }

  handleBottomNavigation(BuildContext context,String route){
    Navigator.of(context).pushReplacementNamed(route, arguments: {'context': context});
  }

}