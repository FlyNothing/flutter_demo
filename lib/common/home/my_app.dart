import 'package:flutter/material.dart';
import 'package:flutter_demo/base/router/origin_demo_page.dart';
import 'package:flutter_demo/base/widget/state_demo_page.dart';
import 'package:flutter_demo/common/router/global_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ScreenUtil初始化的两种方式
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 667));
    return MaterialApp(
      title: 'flutter_demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: GlobalRouter().onGenerateRoute,
      home: const MyHomePage(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 667),
//       builder: (context, child) {
//         return MaterialApp(
//           title: 'flutter_demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           onGenerateRoute: GlobalRouter().onGenerateRoute,
//           home: const MyHomePage(),
//         );
//       },
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: const StateDemoPage(),
    );
  }
}
