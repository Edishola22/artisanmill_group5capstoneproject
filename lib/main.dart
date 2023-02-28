import 'package:artisanmill_group5capstoneproject/firebase_options.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_theme.dart';
import 'package:artisanmill_group5capstoneproject/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'ArtisanMill',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            routerConfig: appRouter.router,
          );
        });
  }
}
