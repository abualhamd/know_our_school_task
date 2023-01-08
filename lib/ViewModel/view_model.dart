//TODO: add your view model class here
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';
import '../utils/constants.dart';

class ViewModel extends ChangeNotifier {
  SchoolInfo? _schoolInfo;
  final SchoolInfo _defaults = SchoolInfo(
      name: Constants.schoolName,
      address: Constants.schoolAddress,
      noStudents: Constants.noStudents,
      noTeachers: Constants.noTeachers);

  Future<void> loadData() async {
    final response = await rootBundle.loadString(Constants.dataPath);
    List jsonList = await json.decode(response);
    Map data = jsonList[0];

    _schoolInfo = SchoolInfo(
        name: data[Constants.schoolName]!,
        address: data[Constants.schoolAddress]!,
        noStudents: data[Constants.noStudents]!,
        noTeachers: data[Constants.noTeachers]!);

    notifyListeners();
  }

  SchoolInfo get getSchoolInfo => _schoolInfo ?? _defaults;
}
