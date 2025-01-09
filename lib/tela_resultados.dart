import 'package:adv_basics/data/perguntas.dart';
import 'package:adv_basics/resumo_perguntas.dart';
import 'package:flutter/material.dart';

class TelaResultados extends StatelessWidget {
  const TelaResultados({
    super.key,
    required this.respostasMarcadas,
    required this.reiniciarQuiz,
  });

  final List<String> respostasMarcadas;
  final Function() reiniciarQuiz;

  List<Map<String, Object>> getResumoDados() {
    final List<Map<String, Object>> resumo = [];

    for (int i = 0; i < respostasMarcadas.length; i++) {
      resumo.add({
        'id_pergunta': i,
        'pergunta': perguntas[i].texto,
        'respostaCorreta': perguntas[i].respostas[0],
        'respostaMarcada': respostasMarcadas[i],
      });
    }

    return resumo;
  }

  @override
  Widget build(BuildContext context) {
    final resumoDados = getResumoDados();
    final int numTotalPerguntas = perguntas.length;
    final int numPerguntasCorretas = resumoDados.where((data) {
      return data['respostaMarcada'] == data['respostaCorreta'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numPerguntasCorretas out of $numTotalPerguntas question${numTotalPerguntas == 1 ? '' : 's'} correctly!',
              style: TextStyle(
                color: Colors.purple.shade50,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ResumoPerguntas(resumoDados),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: reiniciarQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
