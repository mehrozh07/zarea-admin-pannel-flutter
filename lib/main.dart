import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/screens/admin_users.dart';
import 'package:zarea_admin/screens/banner.dart';
import 'package:zarea_admin/screens/categoreis_screen.dart';
import 'package:zarea_admin/screens/exist.dart';
import 'package:zarea_admin/screens/home_screen.dart';
import 'package:zarea_admin/screens/login.dart';
import 'package:zarea_admin/screens/order_screen.dart';
import 'package:zarea_admin/screens/send_notice.dart';
import 'package:zarea_admin/screens/setting.dart';
import 'package:zarea_admin/screens/splash_screen.dart';
import 'package:zarea_admin/screens/vendor_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBIhw4YuMklVcO1wAIFbBCWlgpg9chFlX8",
          authDomain: "zarea-36659.firebaseapp.com",
          projectId: "zarea-36659",
          storageBucket: "zarea-36659.appspot.com",
          messagingSenderId: "674964814559",
          appId: "1:674964814559:web:36d97fb720dd22f8b5876a",
          measurementId: "G-VMWL7W0WJ4"
      ),
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zarea Admin Panel',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff84c225),
      ),
      home: const SplashScreen(),
      routes: {
          HomeScreen.id: (context)=>  HomeScreen(),
        LoginScreen.id: (context)=> const LoginScreen(),
        SplashScreen.id: (context)=> const SplashScreen(),
        SendNotifications.id: (context)=> const SendNotifications(),
        SettingScreen.id: (context)=> const SettingScreen(),
        OrdersScreen.id: (context)=> const OrdersScreen(),
        Exist.id: (context)=> const Exist(),
        AdminUsers.id: (context)=> const AdminUsers(),
        BannerScreen.id: (context)=> const BannerScreen(),
        CategoriesScreen.id: (context)=> const CategoriesScreen(),
        VendorScreen.id: (context)=> const VendorScreen(),


      },
    );
  }
}

