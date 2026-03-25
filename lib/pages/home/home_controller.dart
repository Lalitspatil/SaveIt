import 'package:flutter/material.dart';
import 'package:saveit/navigation/routes.dart';
import 'package:saveit/resources/base_model.dart';

class HomeController extends BaseModel {

 void didTapInsta(BuildContext context) {
     Navigator.of (context).pushNamed (Routes.insta, arguments: {'context': context}) ;
 }
 
}