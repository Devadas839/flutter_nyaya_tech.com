import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/view_summary_response.dart';

class ViewHearingSummaryModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  ViewSummary? viewSummary;
  @override
  void dispose() {}

  Future<void> fetchSummary() async {
    CustomResponse<ViewSummaryResponse> response =
        await ViewSummaryApi().call();
    if (response.statusCode == 200) {
      viewSummary = response.data!.data;
    } else {
      print(response.data!.data);
    }
  }
}
