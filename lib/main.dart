import 'package:flutter/material.dart';
import 'package:utmccos/Model/GetX/Binding/initial_binding.dart';
import 'package:utmccos/Model/GetX/Controller/duplicate_controller.dart';
import 'package:utmccos/View/RootScreen/root.dart';
import 'package:utmccos/View/IntroScreen/intro_screen.dart';
import 'package:utmccos/Model/Initial/initial.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HighPriorityInitial.initial();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool isFirst =
        Get.find<DuplicateController>().introFunctions.getLaunchStatus();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      title: 'UTMCCOS',
      home: isFirst
          ? const IntroScreen()
          : const RootScreen(
              index: 0,
            )
    );
  }
}
