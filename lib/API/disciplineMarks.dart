import 'mark.dart';

class DisciplineMarks {
  List<Mark> marks = [];

  DisciplineMarks.fromJson(List<dynamic> disciplineMarksJson) {
    for (var mark in disciplineMarksJson) {
      this.marks.add(Mark.fromJson(mark));
    }
  }
}
