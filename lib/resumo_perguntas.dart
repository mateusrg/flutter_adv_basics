import 'package:flutter/material.dart';

class ResumoPerguntas extends StatelessWidget {
  const ResumoPerguntas(
    this.dadosResumo, {
    super.key,
  });
  final List<Map<String, Object>> dadosResumo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: dadosResumo.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: data['respostaMarcada'] == data['respostaCorreta']
                        ? Color.fromARGB(255, 119, 189, 246)
                        : Color.fromARGB(255, 254, 105, 247),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${(data['id_pergunta'] as int) + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['pergunta']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${data['respostaMarcada']}',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 151, 113, 255),
                        ),
                      ),
                      Text(
                        '${data['respostaCorreta']}',
                        style: TextStyle(color: Colors.blue.shade300),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
