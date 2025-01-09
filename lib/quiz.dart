import 'package:adv_basics/data/perguntas.dart';
import 'package:adv_basics/tela_inicial.dart';
import 'package:adv_basics/tela_perguntas.dart';
import 'package:adv_basics/tela_resultados.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> respostasSelecionadas = [];
  String? telaAtual;

  void escolherResposta(String resposta) {
    respostasSelecionadas.add(resposta);
    if (respostasSelecionadas.length == perguntas.length) {
      setState(() {
        telaAtual = 'tela-resultados';
      });
    }
  }

  void reiniciarQuiz() {
    setState(() {
      respostasSelecionadas = [];
      telaAtual = 'tela-inicial';
    });
  }

  @override
  void initState() {
    telaAtual = 'tela-inicial';
    super.initState();
  }

  void trocarTela() {
    setState(() {
      telaAtual = 'tela-perguntas';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget telaWidget;

    switch (telaAtual) {
      case 'tela-perguntas':
        telaWidget = TelaPerguntas(aoSelecionarResposta: escolherResposta);
        break;
      case 'tela-resultados':
        telaWidget = TelaResultados(
          respostasMarcadas: respostasSelecionadas,
          reiniciarQuiz: reiniciarQuiz,
        );
        break;
      default:
        telaWidget = TelaInicial(trocarTela);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 68, 1, 184),
                Color.fromARGB(255, 129, 88, 201),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: telaWidget,
        ),
      ),
    );
  }
}
