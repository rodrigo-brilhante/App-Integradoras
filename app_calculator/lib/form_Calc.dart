import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCalc extends StatefulWidget{
  @override
  _FormCalcState createState() => _FormCalcState();
}

class _FormCalcState extends State<FormCalc> {

  final TextEditingController controllerPrimeiroValor = TextEditingController();
  final TextEditingController controllerSegundoValor = TextEditingController();
  double resultado, primeiroValor, segundoValor;

  buildForm() {
    Text labelPrimeiroValor = Text('Digite o primeiro valor');
    TextField fieldPrimeiroValor = TextField(
      keyboardType: TextInputType.number,
      controller: controllerPrimeiroValor,
    );

    Text labelSegundoValor = Text('Digite o segundo valor');
    TextField fieldSegundoValor = TextField(
      keyboardType: TextInputType.number,
      controller: controllerSegundoValor,
    );
    //SOMA
    RaisedButton buttonCalcSum = RaisedButton(
      child: Text(
        '+',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      color: Colors.grey,
      onPressed: () {
        primeiroValor = double.parse(controllerPrimeiroValor.text);
        segundoValor = double.parse(controllerSegundoValor.text);

        setState(() {
          resultado = primeiroValor + segundoValor;
        });

        AlertDialog dialogResultadoOperacao = AlertDialog(
          title: const Text('Resultado da Soma'),
          content: Text('$resultado'),
        );
        showDialog(context: context, builder: (context) => dialogResultadoOperacao);
      },
    );
    //SUBTRACAO
    RaisedButton buttonCalcSub = RaisedButton(
      child: Text(
        '-',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      color: Colors.grey,
      onPressed: () {
        primeiroValor = double.parse(controllerPrimeiroValor.text);
        segundoValor = double.parse(controllerSegundoValor.text);

        setState(() {
          resultado = primeiroValor - segundoValor;
        });

        AlertDialog dialogResultadoOperacao = AlertDialog(
          title: const Text('Resultado da Soma'),
          content: Text('$resultado'),
        );
        showDialog(context: context, builder: (context) => dialogResultadoOperacao);
      },
    );
    //MULTIPLICACAO
    RaisedButton buttonCalcMult = RaisedButton(
      child: Text(
        '*',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      color: Colors.grey,
      onPressed: () {
        primeiroValor = double.parse(controllerPrimeiroValor.text);
        segundoValor = double.parse(controllerSegundoValor.text);

        setState(() {
          resultado = primeiroValor * segundoValor;
        });

        AlertDialog dialogResultadoOperacao = AlertDialog(
          title: const Text('Resultado da Multiplicação'),
          content: Text('$resultado'),
        );
        showDialog(context: context, builder: (context) => dialogResultadoOperacao);
      },
    );
    //DIVISAO
    RaisedButton buttonCalcDiv = RaisedButton(
      child: Text(
        '/',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      color: Colors.grey,
      onPressed: () {
        primeiroValor = double.parse(controllerPrimeiroValor.text);
        segundoValor = double.parse(controllerSegundoValor.text);

        setState(() {
          resultado = primeiroValor / segundoValor;
        });

        if(primeiroValor == 0 || segundoValor == 0)
          {
            AlertDialog dialogDivisaoZero = AlertDialog(
              title: const Text('Não é possível fazer divisão por 0'),
            );
            showDialog(context: context, builder: (context) => dialogDivisaoZero);
          }
        else
          {
            AlertDialog dialogResultadoOperacao = AlertDialog(
              title: const Text('Resultado da Divisão'),
              content: Text('$resultado'),
            );
            showDialog(context: context, builder: (context) => dialogResultadoOperacao);
          }
      },
    );

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 10, bottom: 10, left: 20, right: 20
          ),
          child: Image.asset('imagens/Calc.png'),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20, bottom: 20, left: 20, right: 20
          ),
          child: Column(
            children: <Widget>[
              labelPrimeiroValor,
              fieldPrimeiroValor,
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20, bottom: 20, left: 20, right: 20
          ),
          child: Column(
            children: <Widget>[
              labelSegundoValor,
              fieldSegundoValor,
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10, bottom: 10, left: 10, right: 10
          ),
          child: Row(
            children: <Widget>[
              buttonCalcSum,
              buttonCalcSub,
              buttonCalcMult,
              buttonCalcDiv
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: buildForm(),
    );
  }
}