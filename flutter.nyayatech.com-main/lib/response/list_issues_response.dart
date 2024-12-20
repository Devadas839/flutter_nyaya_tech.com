import 'dart:convert';

ListCasesIssues listCasesIssuesFromJson(String str) =>
    ListCasesIssues.fromJson(json.decode(str));

String listCasesIssues(ListCasesIssues data) => json.encode(data.toJson());

class ListCasesIssues {
  int? status;
  bool? success;
  String? message;
  List<Issues>? data;

  ListCasesIssues({this.status, this.success, this.message, this.data});

  ListCasesIssues.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Issues>[];
      json['data'].forEach((v) {
        data!.add(Issues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Issues {
  int? id;
  String? serviceTitle;
  String? caseType;
  String? issueTitle;

  Issues({this.id, this.serviceTitle, this.caseType, this.issueTitle});

  Issues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceTitle = json['service_title'];
    caseType = json['case_type'];
    issueTitle = json['issue_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_title'] = this.serviceTitle;
    data['case_type'] = this.caseType;
    data['issue_title'] = this.issueTitle;
    return data;
  }
}
