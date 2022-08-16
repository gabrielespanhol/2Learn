class Teachers {
  int? id;
  String? nomeTutor;
  String? sobrenomeTutor;
  String? categoria;
  String? profissaoTutor;
  String? descricaoTutor;
  String? descricaoCurso;
  String? descricaoCursoResumida;
  String? nomeCurso;
  int? valorCurso;
  int? numeroAulas;
  String? caminhoFoto;
  String? formacaoAcademica;
  int? tempoAula;

  Teachers(
      {this.id,
      this.nomeTutor,
      this.sobrenomeTutor,
      this.categoria,
      this.profissaoTutor,
      this.descricaoTutor,
      this.descricaoCurso,
      this.descricaoCursoResumida,
      this.nomeCurso,
      this.valorCurso,
      this.numeroAulas,
      this.caminhoFoto,
      this.formacaoAcademica,
      this.tempoAula});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    formacaoAcademica = json['FormacaoAcademica'];
    tempoAula = json['tempoAula'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['FormacaoAcademica'] = formacaoAcademica;
    data['tempoAula'] = tempoAula;
    return data;
  }
}
