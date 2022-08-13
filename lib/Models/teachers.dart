class Teachers {
  String? nomeTutor;
  String? proficaoTutor;
  String? descricaoTutor;
  String? descricaoCurso;
  String? descricaoCursoResumida;
  int? valorCurso;
  int? numeroAulas;

  Teachers(
      {this.nomeTutor,
      this.proficaoTutor,
      this.descricaoTutor,
      this.descricaoCurso,
      this.descricaoCursoResumida,
      this.valorCurso,
      this.numeroAulas});

  Teachers.fromJson(Map<String, dynamic> json) {
    nomeTutor = json['nomeTutor'];
    proficaoTutor = json['ProficaoTutor'];
    descricaoTutor = json['descricaoTutor'];
    descricaoCurso = json['descricaoCurso'];
    descricaoCursoResumida = json['descricaoCursoResumida'];
    valorCurso = json['valorCurso'];
    numeroAulas = json['numeroAulas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeTutor'] = nomeTutor;
    data['ProficaoTutor'] = proficaoTutor;
    data['descricaoTutor'] = descricaoTutor;
    data['descricaoCurso'] = descricaoCurso;
    data['descricaoCursoResumida'] = descricaoCursoResumida;
    data['valorCurso'] = valorCurso;
    data['numeroAulas'] = numeroAulas;
    return data;
  }
}
