import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spin_wheel_canadia/views/splash_screen/splash_screen.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Disable Landscape Mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      systemNavigationBarContrastEnforced: true,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,  // White status bar icons
      systemNavigationBarIconBrightness: Brightness.light, // White nav bar icons
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
