import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saveit/navigation/provider.dart';
import 'package:saveit/navigation/routes.dart';
import 'package:saveit/pages/splash/splash_view.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/constants.dart';
import 'package:saveit/services/urls.dart';
import 'package:toastification/toastification.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Urls.setBaseURL(); 
  // init();
  runApp(
      MultiProvider(providers: Providers.providerList, child: const Splash()));

}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(360, 690),
      builder: (_, child) {
        return ToastificationWrapper(
          child: MaterialApp(
            title: appName,
            theme: ThemeData(
              scaffoldBackgroundColor: CColors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: CColors.white, shadowColor: CColors.white),
              bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.black.withOpacity(0)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: Routes.onGenerateRoute,
            home: const SplashView(),
          ),
        );
      },
    );

  }
}