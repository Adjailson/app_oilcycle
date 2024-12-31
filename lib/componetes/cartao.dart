import 'package:flutter/material.dart';

class Cartao extends StatelessWidget{

  Cartao(this.contexto, this.dados, this.cor);
  String contexto = "";
  String dados = "";
  Color cor = Color(0xFFffffff);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        color: this.cor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.contexto,style: TextStyle(
                  fontSize: 18, color: Colors.white
              )),
              Text(this.dados, style: TextStyle(
                  fontSize: 35, color: Colors.white
              )),
            ],
          ),
        )
    );
  }
}