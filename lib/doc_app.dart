import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/routing/app_router.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocdocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocdocApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: ColorManager.mainBlue,
            scaffoldBackgroundColor: Colors.white),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
