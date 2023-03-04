import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/firebase_options.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_theme.dart';
import 'package:artisanmill_group5capstoneproject/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthBloc(),
              ),
              BlocProvider(
                create: (context) => NavigationBloc(),
              ),
              BlocProvider(
                create: (context) => UserBloc(),
              ),
              BlocProvider(
                create: (context) => ArtisanBloc(),
              ),
            ],
            child: MaterialApp.router(
              title: 'ArtisansMill',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              routerConfig: appRouter.router,
            ),
          );
        });
  }
}
