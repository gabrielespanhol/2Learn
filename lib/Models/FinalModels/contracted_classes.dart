class ContractedClasses {
  String? givenClasses;
  String? classesName;
  String? numbersClasses;
  String? classesCategory;
  String? nextMetting;
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
      this.nextMetting,
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
    nextMetting = json['nextMetting'];
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
    data['nextMetting'] = nextMetting;
    data['alunoID'] = alunoID;
    data['alunoSex'] = alunoSex;
    data['alunoName'] = alunoName;
    data['tutorName'] = tutorName;
    data['tutorSex'] = tutorSex;
    data['tutorID'] = tutorID;
    return data;
  }
}
