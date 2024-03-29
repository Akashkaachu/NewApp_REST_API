import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini/application/category/category_bloc.dart';
import 'package:mini/application/home/home_bloc.dart';
import 'package:mini/application/movie_science/movie_and_science_bloc.dart';
import 'package:mini/domain/core/di/injectable.dart';
import 'package:mini/screens/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureIngection();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<MovieAndScienceBloc>()),
        BlocProvider(create: (context) => getIt<CategoryBloc>()),
      ],
      child: GetMaterialApp(
        title: 'News App',
        home: const SplashScrn(),
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: Colors.white54),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
