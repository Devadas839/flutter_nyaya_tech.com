import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/list_case_api.dart';
import 'package:nyaya_tech/backend/services/list_issues_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_cases_response.dart';
import 'package:nyaya_tech/response/list_issues_response.dart';

class CasesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  List<CaseCardData> caseData = [];
  List<Issues> issues = [];

  @override
  void dispose() {}

  Future<void> fetchCaseData() async {
    CustomResponse<ListCases> response = await ListCaseApi().call();

    if (response.statusCode == 200) {
      caseData = response.data!.data!.records!;
    } else {
      response.message;
    }
  }

  Future<void> fetchCasesIssue() async {
    CustomResponse<ListCasesIssues> response = await ListIssuesApi().call();
    if (response.statusCode == 200) {
      issues = response.data!.data!;
      List<Map<String, String>> issuesAsMaps = issues.map((issue) {
        return issue
            .toJson()
            .map((key, value) => MapEntry(key, value.toString()));
      }).toList();

      SharedPrefernce.setDataList(issuesAsMaps);
    }
  }
}
