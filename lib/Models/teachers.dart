class Teachers {
  String? nomeTutor;
  String? categoria;
  String? proficaoTutor;
  String? descricaoTutor;
  String? descricaoCurso;
  String? descricaoCursoResumida;
  double? valorCurso;
  int? numeroAulas;
  String? caminhoFoto;
  String? nomecurso;

  Teachers(
      {this.nomeTutor,
      this.categoria,
      this.proficaoTutor,
      this.descricaoTutor,
      this.descricaoCurso,
      this.descricaoCursoResumida,
      this.valorCurso,
      this.numeroAulas,
      this.caminhoFoto,
      this.nomecurso});

  Teachers.fromJson(Map<String, dynamic> json) {
    nomeTutor = json['nomeTutor'];
    categoria = json['categoria'];
    proficaoTutor = json['proficaoTutor'];
    descricaoTutor = json['descricaoTutor'];
    descricaoCurso = json['descricaoCurso'];
    descricaoCursoResumida = json['descricaoCursoResumida'];
    valorCurso = json['valorCurso'];
    numeroAulas = json['numeroAulas'];
    caminhoFoto = json['caminhoFoto'];
    nomecurso = json['nomecurso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeTutor'] = nomeTutor;
    data['categoria'] = categoria;
    data['proficaoTutor'] = proficaoTutor;
    data['descricaoTutor'] = descricaoTutor;
    data['descricaoCurso'] = descricaoCurso;
    data['descricaoCursoResumida'] = descricaoCursoResumida;
    data['valorCurso'] = valorCurso;
    data['numeroAulas'] = numeroAulas;
    data['caminhoFoto'] = caminhoFoto;
    data['nomecurso'] = nomecurso;
    return data;
  }
}
