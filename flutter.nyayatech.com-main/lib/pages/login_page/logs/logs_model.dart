import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/logs_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_logs_response.dart';

class LogsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}
  List<CaseLogs> caselogs = [];
  @override
  void dispose() {}

  Future<void> fetchLogs() async {
    CustomResponse<ListCaseLogs> response = await LogsApi().call();
    if (response.statusCode == 200) {
      caselogs = response.data!.data!.records!;
    }
  }
}
