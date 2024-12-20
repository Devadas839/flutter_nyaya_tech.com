import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';

class HearingSummaryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}

  List<CaseSummary> caseSummary = [];
  String message = '';

  @override
  void dispose() {}

  Future<void> fetchHearingSummary() async {
    CustomResponse<CaseSummaryResponse> response =
        await GetHearingSummaryApi().call();
    if (response.statusCode == 200) {
      caseSummary = response.data!.data!.records!;
    } else {
      response.message;
      message = response.message.toString();
      print(response.message);
    }
  }
}
