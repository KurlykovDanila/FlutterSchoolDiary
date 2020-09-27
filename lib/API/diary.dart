import 'lesson.dart';
import 'disciplineMarks.dart';

class Diary {
  Map<DateTime, List<Lesson>> lessonsPerWeekdays = {};
  Map<String, DisciplineMarks> quaterMarks = {};

  Diary.fromJsons(
      List<dynamic> homeworksJson,
      Map<String, dynamic> timetableJson,
      Map<String, dynamic> quarterMarksJson,
      Map<String, dynamic> totalMarksJson) {
    this._loadQuarterMarks(quarterMarksJson);
    this._loadTimetableLessons(timetableJson);
    this._loadWeekHomeworks(homeworksJson);
  }

  void _loadQuarterMarks(Map<String, dynamic> quarterMarksJson) {
    var discipline = 0;
    String disciplineName;
    while (discipline < quarterMarksJson["discipline_marks"].length) {
      disciplineName =
          quarterMarksJson["discipline_marks"][discipline]["discipline"];
      this.quaterMarks[disciplineName] = DisciplineMarks.fromJson(
          quarterMarksJson["discipline_marks"][discipline]["marks"]);
      discipline++;
    }
  }

  void _loadTimetableLessons(Map<String, dynamic> timetableJson) {
    int day = 0;
    while (day < timetableJson["days"].length) {
      if (timetableJson["days"][day].containsKey("lessons")) {
        this._loadOneDay(timetableJson["days"][day]);
      }
      day++;
    }
  }

  void _loadOneDay(Map<String, dynamic> lessonsJson) {
    this.lessonsPerWeekdays[DateTime.parse(lessonsJson["date"])] = [];
    for (var lesson = 0; lesson < lessonsJson["lessons"].length; lesson++) {
      this
          .lessonsPerWeekdays[DateTime.parse(lessonsJson["date"])]
          .add(Lesson.fromJson(lessonsJson["lessons"][lesson]));
    }
  }

  void _loadWeekHomeworks(List<dynamic> weekHomeworksJson) {
    int lesson;
    for (var day in weekHomeworksJson) {
      lesson = 0;
      while (day["homeworks"].length > lesson) {
        this._loadHomework(day["homeworks"][lesson]);
        lesson++;
      }
    }
  }

  void _loadHomework(dynamic homeworkJson) {
    for (var lesson
        in this.lessonsPerWeekdays[DateTime.parse(homeworkJson["date"])]) {
      if (lesson.discipline == homeworkJson["discipline"] &&
          lesson.homework == null) {
        lesson.loadHomeworkFromJson(homeworkJson);
      }
    }
  }
}
