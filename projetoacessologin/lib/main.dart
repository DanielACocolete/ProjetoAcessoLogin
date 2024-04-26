import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo App para passagem de parâmetro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen ()
    );
  }
}


class HomeScreen extends StatelessWidget {

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Digite o usuario...',
              ),
            ),
            TextField(
              controller: _textController2,
              decoration: InputDecoration(
                hintText: 'Digite a senha...',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nome = _textController.text;
                String senha = _textController2.text;
                if(nome == 'Daniel' && senha == '123'){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => AcessScreen(data: nome),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('O usário ou senha estão errados!!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Fecha o AlertDialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
            },
              child: Text('Login'),
          ),
        ],
      ),
    ),
  );
  }
}

class AcessScreen extends StatelessWidget{
  final String data;

  final TextEditingController _textController = TextEditingController();

    AcessScreen({required this.data});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tela logada'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Olá '),
              Text(
                data,
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Digite alguma coisa...',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String data = _textController.text;
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(data: data),
                      ),
                    );
              },
                child: Text('Detalhes'),
            ),
        ],
          )),

      );
    }
}


class DetailScreen extends StatelessWidget{

  final String data;
  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Detalhes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dados recebidos: '),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        )),
    );
  }
}
