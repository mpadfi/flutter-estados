import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/pages/page1.dart';
import 'package:estados/pages/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, title: 'Material App', initialRoute: 'page1',
        // routes: {
        //   'page1': (_) => Page1Page(),
        //   'page2': (_) => Page2Page(),
        // },
        getPages: [
          GetPage(name: '/page1', page: () => Page1Page()),
          GetPage(name: '/page2', page: () => Page2Page()),
        ]);
  }
}
