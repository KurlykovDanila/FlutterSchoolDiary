import 'package:http/http.dart' as http;
import 'dart:convert';

class Session {
  final Map<String, String> headers = {};

  Future<bool> authentication(String login, String password) async {
    var response = await this._post("https://shkola.nso.ru/auth/login",
        {"login_login": login, "login_password": password}, true);
    if (response.statusCode != 200) return false;
    response = await this._get(
        "https://shkola.nso.ru/actions/snils_checker/fill?no-input=", true);
    if (response.statusCode != 200) return false;
    return true;
  }

  Future<Map<String, dynamic>> jsonTimetable(DateTime date) async {
    var response = await this._get(
        "https://shkola.nso.ru/api/ScheduleService/GetWeekSchedule?date=${date.year}-${date.month}-${date.day}");
    var res = response.statusCode == 200 ? json.decode(response.body) : {};
    return res;
  }

  Future<Map<String, dynamic>> jsonQuarterMarks(DateTime date) async {
    var response = await this._get(
        "https://shkola.nso.ru/api/MarkService/GetSummaryMarks?date=${date.year}-${date.month}-${date.day}");
    var res = response.statusCode == 200 ? json.decode(response.body) : {};
    return res;
  }

  Future<List<dynamic>> jsonWeekHomeworks(DateTime date) async {
    var response = await this._get(
        "https://shkola.nso.ru/api/HomeworkService/GetHomeworkFromRange?date=${date.year}-${date.month}-${date.day}");
    var res = response.statusCode == 200 ? json.decode(response.body) : {};
    return res;
  }

  Future<Map<String, dynamic>> jsonTotalMarks() async {
    var response =
        await this._get("https://shkola.nso.ru/api/MarkService/GetTotalMarks");
    var res = response.statusCode == 200 ? json.decode(response.body) : {};
    return res;
  }

  Future<http.Response> _get(String url, [bool saveCookies = false]) async {
    http.Response response = await http.get(url, headers: headers);
    if (saveCookies) {
      __updateCookie(response);
    }
    return response;
  }

  Future<http.Response> _post(String url, dynamic data,
      [bool saveCookies = false]) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    if (saveCookies) {
      __updateCookie(response);
    }
    return response;
  }

  void __updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
