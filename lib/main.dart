import 'package:dream/MainScreen2.dart';
import 'package:dream/colors/providerTheme.dart';
import 'package:dream/MainScreen.dart';
import 'package:dream/pages/ShopPage.dart';
import 'package:dream/pages/formulario.dart';
import 'package:dream/pages/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'class/shop.dart';
import 'firebase/firebase_options.dart';
import 'pages/cartPage.dart';
import 'pages/homePage.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Shop()),
    ChangeNotifierProvider(create: (context) => ThemeProvider())
  ], child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopPage(),
      //initialRoute: "/loginPage",
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/loginPage': (context) => loginPage(),
        '/MainPage': (context) => MyMainScreen(),
        '/cartPage': (context) => CartPage(),
        '/RegisterPage': (context) => RegisterPage()
        },
    );
  }
}


