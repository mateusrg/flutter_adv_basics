import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial(this.comecarQuiz, {super.key});
  final void Function() comecarQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImagemLogo(),
          SizedBox(height: 50),
          TextoComEstilo(),
          SizedBox(height: 25),
          BotaoCmcQuiz(comecarQuiz: comecarQuiz),
        ],
      ),
    );
  }
}

class ImagemLogo extends StatelessWidget {
  const ImagemLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/quiz-logo.png',
      width: 300,
      color: const Color.fromARGB(150, 255, 255, 255),
    );
  }
}

class TextoComEstilo extends StatelessWidget {
  const TextoComEstilo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Learn Flutter the fun way!',
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 228, 204, 253),
        fontSize: 24,
      ),
    );
  }
}

class BotaoCmcQuiz extends StatelessWidget {
  const BotaoCmcQuiz({
    super.key,
    required this.comecarQuiz,
  });

  final void Function() comecarQuiz;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: comecarQuiz,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
          color: Colors.grey.shade700,
        ),
      ),
      icon: Icon(
        Icons.arrow_right_alt_rounded,
        color: Colors.white,
        size: 30,
      ),
      label: Text('Start Quiz'),
    );
  }
}