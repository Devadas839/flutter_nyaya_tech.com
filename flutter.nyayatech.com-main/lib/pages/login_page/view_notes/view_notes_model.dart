import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';

import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/view_notes_response.dart';

class ViewNotesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  ViewNotes? viewNotes;
  @override
  void dispose() {}

  Future<void> fetchviewNotes() async {
    CustomResponse<ViewCasesNotesResponse> response =
        await ViewNotesApi().call();
    if (response.statusCode == 200) {
      viewNotes = response.data!.data;
    } else {
      response.message;
    }
  }
}
