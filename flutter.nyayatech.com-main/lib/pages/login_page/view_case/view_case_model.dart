import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/view_case_api.dart';
import 'package:nyaya_tech/components/details_screen_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/view_case_response.dart';

class ViewCaseModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for details_screen component.
  late DetailsScreenModel detailsScreenModel;

  @override
  void initState(BuildContext context) {
    detailsScreenModel = createModel(context, () => DetailsScreenModel());
  }

  ViewCase? viewCase;

  @override
  void dispose() {
    detailsScreenModel.dispose();
  }

  Future<void> fetchViewCase() async {
    CustomResponse<ViewCasesResponse> response = await ViewCaseApi().call();
    if (response.statusCode == 200) {
      viewCase = response.data!.data;
    } else {
      response.message;
    }
  }
}
