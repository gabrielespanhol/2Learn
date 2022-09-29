class Users {
  String? academicFormation;
  String? email;
  String? cpf;
  String? lastName;
  String? name;
  String? personalDescription;
  String? profilePic;
  String? uid;
  String? userSex;
  String? userType;
  String? level;
  String? profession;

  Users(
      {this.academicFormation,
      this.email,
      this.cpf,
      this.lastName,
      this.name,
      this.personalDescription,
      this.profilePic,
      this.uid,
      this.userSex,
      this.userType,
      this.level,
      this.profession});

  Users.fromJson(Map<String, dynamic> json) {
    academicFormation = json['academicFormation'];
    email = json['email'];
    cpf = json['cpf'];
    lastName = json['lastName'];
    name = json['name'];
    personalDescription = json['personalDescription'];
    profilePic = json['profilePic'];
    uid = json['uid'];
    userSex = json['userSex'];
    userType = json['userType'];
    level = json['level'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['academicFormation'] = academicFormation;
    data['email'] = email;
    data['cpf'] = cpf;
    data['lastName'] = lastName;
    data['name'] = name;
    data['personalDescription'] = personalDescription;
    data['profilePic'] = profilePic;
    data['uid'] = uid;
    data['userSex'] = userSex;
    data['userType'] = userType;
    data['level'] = level;
    data['profession'] = profession;
    return data;
  }
}
