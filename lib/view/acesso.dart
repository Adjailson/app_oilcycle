import 'package:flutter/material.dart';

class Acesso extends StatelessWidget{
  const Acesso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/oilcycle-logo.png",width: 250,),
            SizedBox(height: 20),
            OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, '/status');
            }, child: Text("Status da máquina"))
          ],
        ),
      ),
    );
  }
}