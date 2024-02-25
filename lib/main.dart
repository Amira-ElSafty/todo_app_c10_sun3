import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_sun3/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c10_sun3/auth/register/register_screen.dart';
import 'package:flutter_app_todo_c10_sun3/home/home_screen.dart';
import 'package:flutter_app_todo_c10_sun3/my_theme.dart';
import 'package:flutter_app_todo_c10_sun3/providers/auth_provider.dart';
import 'package:flutter_app_todo_c10_sun3/providers/list_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance.settings =
  //     Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ListProvider()),
      ChangeNotifierProvider(create: (context) => AuthProviders()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
