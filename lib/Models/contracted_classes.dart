class ContractedClasses {
  String? givenClasses;
  String? classesName;
  String? numbersClasses;
  String? classesCategory;
  List? meetings;
  String? alunoID;
  String? alunoSex;
  String? alunoName;
  String? tutorName;
  String? tutorSex;
  String? tutorID;

  ContractedClasses(
      {this.givenClasses,
      this.classesName,
      this.numbersClasses,
      this.classesCategory,
      this.meetings,
      this.alunoID,
      this.alunoSex,
      this.alunoName,
      this.tutorName,
      this.tutorSex,
      this.tutorID});

  ContractedClasses.fromJson(Map<String, dynamic> json) {
    givenClasses = json['givenClasses'];
    classesName = json['classesName'];
    numbersClasses = json['numbersClasses'];
    classesCategory = json['classesCategory'];
    if (json['meetings'] != null) {
      meetings = <Null>[];
      json['meetings'].forEach((v) {
        meetings!.add(v.fromJson(v));
      });
    }
    alunoID = json['alunoID'];
    alunoSex = json['alunoSex'];
    alunoName = json['alunoName'];
    tutorName = json['tutorName'];
    tutorSex = json['tutorSex'];
    tutorID = json['tutorID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['givenClasses'] = givenClasses;
    data['classesName'] = classesName;
    data['numbersClasses'] = numbersClasses;
    data['classesCategory'] = classesCategory;
    if (meetings != null) {
      data['meetings'] = meetings!.map((v) => v.toJson()).toList();
    }
    data['alunoID'] = alunoID;
    data['alunoSex'] = alunoSex;
    data['alunoName'] = alunoName;
    data['tutorName'] = tutorName;
    data['tutorSex'] = tutorSex;
    data['tutorID'] = tutorID;
    return data;
  }
}
