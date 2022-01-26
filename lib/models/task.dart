import 'dart:io';

class Issue {
  int? id;
  String? name;
  String? note;
  int? isCompleted;
  String? date;
  int? phoneNu;
  int? color;
  String? issueNumber;
  String? issue;
  Issue({
    this.id,
    this.name,
    this.note,
    this.isCompleted,
    this.date,
    this.color,
    this.issueNumber,
    this.issue,
    this.phoneNu,
  });
  Issue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    color = json['color'];
    issueNumber = json['issueNumber'];
    issue = json['issue'];
    phoneNu = json['phoneNu'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['phoneNu'] = this.phoneNu;
    data['color'] = this.color;
    data['issueNumber'] = this.issueNumber;
    data['issue'] = this.issue;

    return data;
  }
}
