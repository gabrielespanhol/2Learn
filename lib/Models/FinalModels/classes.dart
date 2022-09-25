class Classes {
  String? category;
  String? classId;
  String? className;
  String? description;
  String? durationClasses;
  String? numberClasses;
  String? shortDescription;
  String? tutorId;
  String? tutorName;
  String? valueClasses;
  String? profilePicTeacher;

  Classes(
      {this.category,
      this.classId,
      this.className,
      this.description,
      this.durationClasses,
      this.numberClasses,
      this.shortDescription,
      this.tutorId,
      this.tutorName,
      this.valueClasses,
      this.profilePicTeacher});

  Classes.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    classId = json['classId'];
    className = json['className'];
    description = json['description'];
    durationClasses = json['durationClasses'];
    numberClasses = json['numberClasses'];
    shortDescription = json['shortDescription'];
    tutorId = json['tutorId'];
    tutorName = json['tutorName'];
    valueClasses = json['valueClasses'];
    profilePicTeacher = json['profilePicTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['classId'] = classId;
    data['className'] = className;
    data['description'] = description;
    data['durationClasses'] = durationClasses;
    data['numberClasses'] = numberClasses;
    data['shortDescription'] = shortDescription;
    data['tutorId'] = tutorId;
    data['tutorName'] = tutorName;
    data['valueClasses'] = valueClasses;
    data['profilePicTeacher'] = profilePicTeacher;
    return data;
  }
}
