import 'package:flutter/material.dart';
import 'package:local_notifaiction/db/db_helper.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:provider/provider.dart';

class IssueProvder with ChangeNotifier {
  Future<List<Issue>> getIssue(
    context,
  ) async {
    /* this is for get data Issue */
    notifyListeners();
    return await IssueController().getTask();
    // return await DBHelper.db.query();
  }

  Future<int> addIssue(Issue issue) async {
    /* this is for get data Issue */

    notifyListeners();
    return await DBHelper.insert(issue);
  }

  void delete(Issue issue) async {
    DBHelper.delete(issue);
    notifyListeners();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    notifyListeners();
  }

  Future<dynamic> updateIssue(Issue issue) async {
    notifyListeners();

    return await DBHelper.updateIssue(issue);
  }
}

class IssueController {
  Future<List<Issue>> getTask() async {
    return await DBHelper.db.query();
  }
}
