class CourseCategory {
  int? id;
  String? nomeCategoria;

  CourseCategory({this.id, this.nomeCategoria});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeCategoria = json['nomeCategoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nomeCategoria'] = nomeCategoria;
    return data;
  }
}
