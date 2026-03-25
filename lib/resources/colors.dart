
import 'package:flutter/material.dart';

class CColors {
  static Color hexToRgb(String hexColor) {
    // Remove the leading '#' if present
    hexColor = hexColor.replaceFirst('#', '');

    // Convert hex to integer
    int hexValue = int.parse(hexColor, radix: 16);

    // Extract RGB components
    int red = (hexValue >> 16) & 0xFF;
    int green = (hexValue >> 8) & 0xFF;
    int blue = hexValue & 0xFF;

    return Color.fromRGBO(red, green, blue, 1);
  }

  static const primaryColor = Color.fromRGBO(255, 168, 0, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const dullGreen = Color.fromRGBO(196, 234, 207, 1);
  static const parrotColor = Color.fromRGBO(178, 255, 0, 1);
  static const grey = Color.fromRGBO(212, 212, 212, 1);
  static const yellow = Color.fromRGBO(255, 235, 59, 1); 
  static const lightBluishWhite = Color.fromRGBO(245, 247, 255, 1); 
  static const secondaryText = Color.fromRGBO(92, 92, 92, 1); 
  static const themeBg = Color(0xFF7E2CF3);
  static Color green1 = hexToRgb('#14441A');
  static Color green2 = hexToRgb('#33913F');
  static Color dullText = hexToRgb('878787');
  static Color textGrey = hexToRgb('656565');
  static Color red = hexToRgb('FF0000');
  static Color lightOrange = hexToRgb('FFF5EF');
  static Color lightGreen = hexToRgb('E6F5EA');
  static Color green = hexToRgb('00b300');
  static Color lightBlue = hexToRgb('F0F3FF');
  static Color lightViolet = hexToRgb('F4EBFF');
  static Color lightYellow = hexToRgb('FFF7E8');
  static Color gradientLightOrange = hexToRgb('FFEFCF');
  static Color lightPink = hexToRgb('FFF2F2');
  static Color profileCard = hexToRgb('FEEAC6');
  static Color blueCard = hexToRgb('EBE9F3');
  static Color orange1 = hexToRgb('FFA800'); 
  static Color orange2 = hexToRgb('FF833D'); 
  static Color familyCard = hexToRgb('F7F4FF');
  static Color borderOrange = hexToRgb('FEEAC6');
  static Color lighGrey = hexToRgb('F1F6FC');
  static Color borderGrey = hexToRgb('E9E9E9');
  static Color orange = hexToRgb('FF7A00');
  static Color gradientStroke = hexToRgb('9795E8');
  static Color gradientViolet = hexToRgb('5B4BDB');
  static Color gradientLightViolet = hexToRgb('E8F2FF');
  static Color gradientDarkViolet = hexToRgb('9770FF');
  static Color gradientWhite = hexToRgb('FFF9EE');
  static Color shadeOrange = hexToRgb('FFF4DE');
  static Color iconOrange = hexToRgb('FFF1EA');
  static Color brown = hexToRgb('B17501');
  static Color lightShadeRed = hexToRgb('FFC9AA');
  static Color lightBrown = hexToRgb('FFEECC');
  static Color shadeBlue = hexToRgb('E0ECFA');
  static Color darkBlue = hexToRgb('226CCA');
  static Color lightShadeBlue = hexToRgb('D8E7FB');
  static Color whitePink = hexToRgb('F4EFFF');
  static Color whiteBlue = hexToRgb('F2F8FF');
  static Color borderPink = hexToRgb('F0DED3');
  static Color textBrown = hexToRgb('C0571C');
  static Color stepperDisabled = hexToRgb('F3E9D6');
  static Color maintenanceGreyText = hexToRgb('5C5C5C');
  static Color maintenanceBorder = hexToRgb('FFF0DB');
  static Color maintenaceCardBorder = hexToRgb('C0A8FF');
  static Color ticketBorder = hexToRgb('F6D5A9');
  static Color lightBlueCall = hexToRgb('509FFF');
  static Color activityBorder = hexToRgb('CBD5E1');
  static Color maintaineanceBorderColor = hexToRgb('FFE2D3');
  static Color textShadeBlack = hexToRgb('8B8B8B');
  static Color meetingCompletedStatus = hexToRgb('218139');
  static Color meetingCancelledStatus = hexToRgb('D12E34');
  
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase().substring(2)}';
}

Color hexToColor(String hex) {
  // Remove the leading '#' if present
  hex = hex.replaceAll("#", "");
  
  // If the hex string is 6 characters long, add 'FF' for the opacity (alpha channel)
  if (hex.length == 6) {
    hex = "FF$hex";
  }
  // Parse the hex string and create a Color object
  return Color(int.parse(hex, radix: 16));
}