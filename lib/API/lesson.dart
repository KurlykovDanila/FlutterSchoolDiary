import 'homework.dart';

class Lesson {
  Homework homework = null;
  bool homeworkIsEmpty = true;

  String discipline;
  int index;
  String office;
  String timeBegin;
  int studyTimeShift;
  String timeEnd;
  DateTime date;
  String teacher;

  Lesson.fromJson(Map<String, dynamic> json) {
    discipline = json["discipline"];
    index = json["index"];
    office = json["office"];
    timeBegin = json["time_begin"];
    studyTimeShift = json["study_time_shift"];
    timeEnd = json["time_end"];
    date = DateTime.parse(json["date"]);
    teacher = json["teacher"];
  }

  void loadHomeworkFromJson(Map<String, dynamic> homeworkJson) {
    this.homework = Homework.fromJson(homeworkJson);
    
  }
}
