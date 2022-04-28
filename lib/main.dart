import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:handson/controllers/home_controller.dart';
import 'package:handson/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      
      systemNavigationBarColor: Colors.transparent));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
              title: 'Savings',
              theme: ThemeData(
                fontFamily: 'DMSans',
                primarySwatch: Colors.grey,
              ),
              home: const HomePage(),
            ));
  }
}
