import 'package:flutter/material.dart';

class BotaoResposta extends StatelessWidget {
  const BotaoResposta({
    required this.textoResposta,
    required this.aoClicar,
    super.key,
  });

  final String textoResposta;
  final void Function() aoClicar;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: aoClicar,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 12, 88),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        textoResposta,
        textAlign: TextAlign.center,
      ),
    );
  }
}
