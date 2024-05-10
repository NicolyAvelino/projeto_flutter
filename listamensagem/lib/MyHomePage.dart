import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  List<String> mensagens = List.empty(growable: true);

  int iAtual = 0;

  void janelaAlerta(BuildContext context, String msg) {
    Widget okButton = TextButton(
        child: Text('Ok!'),
        onPressed: () {
          Navigator.pop(context);
        });
    var alerta = AlertDialog(
      actions: [okButton],
      title: Text('Aviso'),
      content: Text(msg),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        });
  }

  void _adiciona() {
    setState(() {
      mensagens.add(myController.text);
      iAtual = mensagens.length - 1;
      janelaAlerta(context,
          "Última mensagem: ${myController.text} \nQuantidade de mensagens: ${mensagens.length}.");
      myController.clear();
    });
  }

  void _primeira() {
    setState(() {
      if (mensagens.isNotEmpty) {
        myController.text = mensagens[0];
        iAtual = 0;
      } else {
        janelaAlerta(context, "A lista de mensagem está vazia!");
      }
    });
  }

  void _anterior() {
    setState(() {
      if (mensagens.isNotEmpty) {
        if (iAtual == 0) {
          janelaAlerta(context, "A mensagem atual é a primeira.");
        } else {
          iAtual--;
          myController.text = mensagens[iAtual];
        }
      } else {
        janelaAlerta(context, "A lista está vazia.");
      }
    });
  }

  void _proxima() {
    setState(() {
      if (mensagens.isNotEmpty) {
        if (iAtual == mensagens.length - 1) {
          janelaAlerta(context, "A última mensagem já está na tela.");
        } else {
          iAtual++;
          myController.text = mensagens[iAtual];
        }
      } else {
        janelaAlerta(context, "A lista está vazia.");
      }
    });
  }

  void _ultima() {
    setState(() {
      if (mensagens.isNotEmpty) {
        myController.text = mensagens[mensagens.length - 1];
      } else {
        janelaAlerta(context, "Lista vazia!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 208, 233, 245),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Mensagem:'),

              TextField(
                  controller: myController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  minLines: 1,
                  maxLines: 5),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              _adiciona();
                            },
                            child: const Text('+'))),
                    Flexible(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              _primeira();
                            },
                            child: const Text('<<'))),
                    Flexible(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              _anterior();
                            },
                            child: const Text('<'))),
                    Flexible(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              _proxima();
                            },
                            child: const Text('>'))),
                    Flexible(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              _ultima();
                            },
                            child: const Text('>>')))
                  ]) //fecha ElevatedButton​
            ],
          ),
        ));
  } //build​
}//classe
