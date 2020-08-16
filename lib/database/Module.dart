import 'package:uuid/uuid.dart';

class Module {
  static final Uuid uuid = new Uuid();
  String id;
  int semester;
  String name;
  double grade;
  double credits;

  Module(int semester, String name, double grade, double credits) {
    this.semester = semester;
    this.name = name;
    this.grade = grade;
    this.credits = credits;
    this.id = uuid.v1().toString();
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['semester'] = semester;
    map['name'] = name;
    map['grade'] = grade;
    map['credits'] = credits;

    return map;
  }

  // Object extraction from a Map object
  Module.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.semester = map['semester'];
    this.name = map['name'];
    this.grade = map['grade'];
    this.credits = map['credits'];
  }
}
