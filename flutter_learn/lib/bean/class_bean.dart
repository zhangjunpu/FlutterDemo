/// 班级
/// [author] junpu
/// [date] 2020/9/15
class ClassBean {
  String groupId;
  String name;
  List<StudentBean> students;

  ClassBean.fromJsonMap(Map<String, dynamic> map) {
    groupId = map["groupId"];
    name = map["name"];
    students = List<StudentBean>.from(
        map["students"].map((it) => StudentBean.fromJsonMap(it)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = groupId;
    data['name'] = name;
    data['students'] =
        students != null ? this.students.map((v) => v.toJson()).toList() : null;
    return data;
  }

  @override
  String toString() {
    return 'ClassBean{groupId: $groupId, name: $name, students: $students}';
  }
}

/// 学生
/// [author] junpu
/// [date] 2020/9/15
class StudentBean {
  String studentId;
  String name;
  int sex;
  String pubSchoolName;
  int enterFace;
  dynamic isPush;
  dynamic isBindParent;
  int signIn;

  StudentBean.fromJsonMap(Map<String, dynamic> map) {
    studentId = map["studentId"];
    name = map["name"];
    sex = map["sex"];
    pubSchoolName = map["pubSchoolName"];
    enterFace = map["enterFace"];
    isPush = map["isPush"];
    isBindParent = map["isBindParent"];
    signIn = map["signIn"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = studentId;
    data['name'] = name;
    data['sex'] = sex;
    data['pubSchoolName'] = pubSchoolName;
    data['enterFace'] = enterFace;
    data['isPush'] = isPush;
    data['isBindParent'] = isBindParent;
    data['signIn'] = signIn;
    return data;
  }

  @override
  String toString() {
    return 'StudentBean{studentId: $studentId, name: $name, sex: $sex, pubSchoolName: $pubSchoolName, enterFace: $enterFace, isPush: $isPush, isBindParent: $isBindParent, signIn: $signIn}';
  }
}
