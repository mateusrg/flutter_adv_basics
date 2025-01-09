import 'package:adv_basics/models/botao_resposta.dart';
import 'package:adv_basics/data/perguntas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaPerguntas extends StatefulWidget {
  const TelaPerguntas({
    super.key,
    required this.aoSelecionarResposta,
  });
  final void Function(String resposta) aoSelecionarResposta;

  @override
  State<TelaPerguntas> createState() => _TelaPerguntasState();
}

class _TelaPerguntasState extends State<TelaPerguntas> {
  int idPerguntaAtual = 0;
  void responderPergunta(String respostaSelecionada) {
    widget.aoSelecionarResposta(respostaSelecionada);
    setState(() => idPerguntaAtual++);
  }

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = perguntas[idPerguntaAtual];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              perguntaAtual.texto,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 228, 204, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...perguntaAtual.getRespostasEmbaralhadas().map((texto) {
              return BotaoResposta(
                textoResposta: texto,
                aoClicar: () => responderPergunta(texto),
              );
            }),
          ],
        ),
      ),
    );
  }
}
