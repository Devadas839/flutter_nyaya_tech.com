import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_case_response.dart';

class NotesScreenModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  List<NotesData> notesData = [];
  @override
  void dispose() {}

  Future<void> fetchNotes() async {
    CustomResponse<CasesNotesResponse> response = await NotesApi().call();
    if (response.statusCode == 200) {
      notesData = response.data!.data!.records!;
    } else {
      response.message;
    }
  }
}
