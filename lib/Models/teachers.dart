class Teachers {
  String? nomeTutor;
  String? sobrenomeTutor;
  String? categoria;
  String? profissaoTutor;
  String? descricaoTutor;
  String? descricaoCurso;
  String? descricaoCursoResumida;
  String? nomeCurso;
  double? valorCurso;
  int? numeroAulas;
  String? caminhoFoto;

  Teachers(
      {this.nomeTutor,
      this.sobrenomeTutor,
      this.categoria,
      this.profissaoTutor,
      this.descricaoTutor,
      this.descricaoCurso,
      this.descricaoCursoResumida,
      this.nomeCurso,
      this.valorCurso,
      this.numeroAulas,
      this.caminhoFoto});

  Teachers.fromJson(Map<String, dynamic> json) {
    nomeTutor = json['nomeTutor'];
    sobrenomeTutor = json['sobrenomeTutor'];
    categoria = json['categoria'];
    profissaoTutor = json['profissaoTutor'];
    descricaoTutor = json['descricaoTutor'];
    descricaoCurso = json['descricaoCurso'];
    descricaoCursoResumida = json['descricaoCursoResumida'];
    nomeCurso = json['nomeCurso'];
    valorCurso = json['valorCurso'];
    numeroAulas = json['numeroAulas'];
    caminhoFoto = json['caminhoFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeTutor'] = nomeTutor;
    data['sobrenomeTutor'] = sobrenomeTutor;
    data['categoria'] = categoria;
    data['profissaoTutor'] = profissaoTutor;
    data['descricaoTutor'] = descricaoTutor;
    data['descricaoCurso'] = descricaoCurso;
    data['descricaoCursoResumida'] = descricaoCursoResumida;
    data['nomeCurso'] = nomeCurso;
    data['valorCurso'] = valorCurso;
    data['numeroAulas'] = numeroAulas;
    data['caminhoFoto'] = caminhoFoto;
    return data;
  }
}
