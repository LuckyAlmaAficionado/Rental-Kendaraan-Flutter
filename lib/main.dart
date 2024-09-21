import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rental_motor/design/splash/bloc/splash_bloc.dart';
import 'package:rental_motor/utils/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Rental Motor',
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!),
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
          textTheme: GoogleFonts.outfitTextTheme(),
          primaryTextTheme: GoogleFonts.outfitTextTheme(),
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: HexColor('C3E54B'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: GoogleFonts.outfit(),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: listRoutes,
        initialRoute: '/',
        supportedLocales: const [
          Locale('id', 'ID'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
