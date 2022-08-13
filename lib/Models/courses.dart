class Courses {
  int? id;
  String? tipoCurso;
  String? nomeCurso;
  int? aulaRealizada;
  int? totalAulas;
  String? nomeTutor;
  String? proximoEncontro;

  Courses(
      {this.id,
      this.tipoCurso,
      this.nomeCurso,
      this.aulaRealizada,
      this.totalAulas,
      this.nomeTutor,
      this.proximoEncontro});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoCurso = json['tipoCurso'];
    nomeCurso = json['nomeCurso'];
    aulaRealizada = json['aulaRealizada'];
    totalAulas = json['totalAulas'];
    nomeTutor = json['nomeTutor'];
    proximoEncontro = json['proximoEncontro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tipoCurso'] = tipoCurso;
    data['nomeCurso'] = nomeCurso;
    data['aulaRealizada'] = aulaRealizada;
    data['totalAulas'] = totalAulas;
    data['nomeTutor'] = nomeTutor;
    data['proximoEncontro'] = proximoEncontro;
    return data;
  }
}
