class PerguntaQuiz {
  const PerguntaQuiz(this.texto, this.respostas);

  final String texto;
  final List<String> respostas;

  List<String> getRespostasEmbaralhadas() {
    final listaEmbaralhada = List.of(respostas);
    listaEmbaralhada.shuffle();
    return listaEmbaralhada;
  }
}
