import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernce {
  static late SharedPreferences preferences;
  static const String accessToken = 'accesstoken';
  static const String userType = 'userType';
  static const String caseId = 'caseId';
  static const String notesId = 'notesId';
  static const String fileId = 'fileId';
  static const String email = 'email';
  static const String summarydate = 'summaryDate';
  static const String summaryid = 'summaryId';
  static const String dataListKey = 'dataList';
  static const String servicetitle = 'servicetitle';
  static const String casetitle = 'casetitle';
  static const String issuetitle = 'issuetitle';
  static const String assigneLawId = 'assigneLawId';
  static const String isNewUser = 'isNewUser';
  static const String loginId = 'loginId';
  static const String profileid = 'profileid';
  static const String createPhone = 'createPhone';

  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  ///Method that saves the [accessToken].
  static Future<bool> setAccessToken(String value) async =>
      preferences.setString(accessToken, value);

  ///Method that returns the [accessToken].
  static String getAccessToken() => preferences.getString(accessToken) ?? '';

  ///Method that saves the [userType].
  static Future<bool> setUsertype(String value) async =>
      preferences.setString(userType, value);

  ///Method that returns the [userType].
  static String getUsertype() => preferences.getString(userType) ?? '';

  ///Method that saves the [email].
  static Future<bool> setemail(String value) async =>
      preferences.setString(email, value);

  ///Method that returns the [email].
  static String getemail() => preferences.getString(email) ?? '';

  ///Method that saves the [caseId].
  static Future<bool> setcaseId(int value) async =>
      preferences.setInt(caseId, value);

  ///Method that returns the [caseId].
  static int getcaseId() => preferences.getInt(caseId) ?? 0;

  ///Method that saves the [notesId].
  static Future<bool> setnotesId(String value) async =>
      preferences.setString(notesId, value);

  ///Method that returns the [notesId].
  static String getnotesId() => preferences.getString(notesId) ?? '';

  ///Method that saves the [fileId].
  static Future<bool> setfileId(String value) async =>
      preferences.setString(fileId, value);

  ///Method that returns the [fileId].
  static String getfileId() => preferences.getString(fileId) ?? '';

  ///Method that saves the [summarydate].
  static Future<bool> setSummary(String value) async =>
      preferences.setString(summarydate, value);

  ///Method that returns the [summarydate].
  static String getSummary() => preferences.getString(summarydate) ?? '';

  ///Method that saves the [summaryid].
  static Future<bool> setsummaryid(String value) async =>
      preferences.setString(summaryid, value);

  ///Method that returns the [summaryid].
  static String getsummaryid() => preferences.getString(summaryid) ?? '';

  ///Method that saves the [servicetitle].
  static Future<bool> setservicetitle(String value) async =>
      preferences.setString(servicetitle, value);

  ///Method that returns the [servicetitle].
  static String getservicetitle() => preferences.getString(servicetitle) ?? '';

  ///Method that saves the [casetitle].
  static Future<bool> setcasetitle(String value) async =>
      preferences.setString(casetitle, value);

  ///Method that returns the [casetitle].
  static String getcasetitle() => preferences.getString(casetitle) ?? '';

  ///Method that saves the [issuetitle].
  static Future<bool> setissuetitle(String value) async =>
      preferences.setString(issuetitle, value);

  ///Method that returns the [issuetitle].
  static String getissuetitle() => preferences.getString(issuetitle) ?? '';

  ///Method that saves the [assigneLawId].
  static Future<bool> setassigneLawId(String value) async =>
      preferences.setString(assigneLawId, value);

  ///Method that returns the [assigneLawId].
  static String getassigneLawId() => preferences.getString(assigneLawId) ?? '';

  ///Method that saves the [isNewUser].
  static Future<bool> setisNewUser(bool value) async =>
      preferences.setBool(isNewUser, value);

  ///Method that returns the [isNewUser].
  static bool getisNewUser() => preferences.getBool(isNewUser) ?? false;

  ///Method that saves the [loginId].
  static Future<bool> setloginId(int value) async =>
      preferences.setInt(loginId, value);

  ///Method that returns the [loginId].
  static int getloginId() => preferences.getInt(loginId) ?? 0;

  ///Method that saves the [profileid].
  static Future<bool> setprofileid(int value) async =>
      preferences.setInt(profileid, value);

  ///Method that returns the [profileid].
  static int getprofileid() => preferences.getInt(profileid) ?? 0;

  ///Method that saves the [createPhone].
  static Future<bool> setcreatePhone(String value) async =>
      preferences.setString(createPhone, value);

  ///Method that returns the [createPhone].
  static String getcreatePhone() => preferences.getString(createPhone) ?? '';

  static Future<bool> setDataList(List<Map<String, String>> dataList) async {
    String jsonString = jsonEncode(dataList);
    return preferences.setString(dataListKey, jsonString);
  }

  static List<Map<String, String>> getDataList() {
    String? jsonString = preferences.getString(dataListKey);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => Map<String, String>.from(e)).toList();
    }
    return [];
  }

  static Future<bool> remove(String key) async => await preferences.remove(key);

  static Future<bool> clear() async => await preferences.clear();
}
