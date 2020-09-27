class Mark {
  String description;
  DateTime date;
  String mark;

  Mark.fromJson(Map<String, dynamic> markJson) {
    description = markJson["description"];
    date = DateTime.parse(markJson["date"]);
    mark = markJson["mark"];
  }
}
