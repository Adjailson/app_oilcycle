import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oilcycle/componetes/cartao.dart';

class Status extends StatefulWidget{
  const Status({super.key});

  @override
  _Status createState()=> _Status();
}
class _Status extends State<Status>{

  late Timer _timer;
  late Stream<List<dynamic>> _dataStream;

  @override
  void initState() {
    super.initState();
    _dataStream = fetchDataStream();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Função que retorna um Stream
  Stream<List<dynamic>> fetchDataStream() async* {
    while (true) {
      try {
        final response = await http.get(
          Uri.parse('https://api-oilcycle.onrender.com/statusMaquina/20240.2PA'),
        );

        if (response.statusCode == 200) {
          yield json.decode(response.body);
        } else {
          yield [{'Erro': response.statusCode}];
        }
      } catch (e) {
        yield [{'Erro': e}];
      }

      // Aguardar 1 segundo antes de fazer a próxima requisição
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modelo: 20240.2PA"),
        backgroundColor: Color(0xFF6eb130),),

      body: StreamBuilder<List<dynamic>>(
        stream: _dataStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            if (data.contains('error')) {
              return Center(child: Text(data[0]['error']));
            }
            return GridView.count(
                crossAxisCount: 2,
              children: [
                Cartao("Nível do óleo", "${data[0]['nivel_oleo']}%", Colors.amber),
                Cartao("Temperatura do óleo", "${data[0]['temperatura_oleo']}ºC", Colors.deepOrangeAccent),
                Cartao("Nível da água", "${data[0]['nivel_agua']}%", Colors.blue),
                Cartao("Nível do detegente", "${data[0]['nivel_detegente']}%", Colors.cyan),
                Cartao("Contém soda", "Off", Colors.white10),
                Cartao("Motor de mexer", "${statusMotor(data[0]['status_motor'])}", Colors.orange)
              ],
            );
          } else {
            return Center(child: Cartao("Status máquina", "Off", Colors.redAccent));
          }
        },
      ),
    );
  }
  
  String statusMotor(int valor){
    if (valor==0){
      return "Off";
    }else{
      return "On";
    }
  }
}