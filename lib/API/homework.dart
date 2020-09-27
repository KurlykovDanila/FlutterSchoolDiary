class Homework {
  String nextHomework;
  List nextMaterials;
  List nextIndividualHomeworks;
  String theme;
  List materials;
  List individualHomeworks;
  String homework;
  bool isEmpty = true;

  Homework.fromJson(Map<String, dynamic> json)
      : nextHomework = json["nextHomework"],
        nextMaterials = json["nextMaterials"],
        nextIndividualHomeworks = json["nextIndividualHomeworks"],
        theme = json["theme"],
        materials = json["materials"],
        individualHomeworks = json["individualHomeworks"],
        homework = json["homework"];

  bool homeworkIsEmpty() {
    
  }
}
