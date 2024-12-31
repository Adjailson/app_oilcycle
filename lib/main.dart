import 'package:flutter/material.dart';
import 'package:oilcycle/view/acesso.dart';
import 'package:oilcycle/view/status.dart';

void main() {
  runApp(const OilCycle());
}

class OilCycle extends StatelessWidget {
  const OilCycle({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OilCycle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6eb130)),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      initialRoute: '/acesso',
      routes: {
        '/acesso': (context)=> const Acesso(),
        '/status': (context)=> const Status()
      },
    );
  }
}
