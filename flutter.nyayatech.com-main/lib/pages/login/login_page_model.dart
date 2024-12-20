
import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/login_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/pages/login/login_page_widget.dart';
import 'package:nyaya_tech/response/mail_response.dart';

class MobileLoginModel extends FlutterFlowModel<MobileLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  
bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }











  Future<void> fetchMail({required String mail}) async {
    CustomResponse<SendOtpResponse> response =
        await SendOtpApi().call(title: mail);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        break;
      case 422:
        message = response.data!.message.toString();
        errorInstance = response.data!.errData != null
            ? {
                "phone": response.data!.errData!.phone?.join(', ') ??
                    "Unknown error",
              }
            : null;
        isValidation = true;
        error = true;
      case 401:
        message = response.data!.message.toString();
        isValidation = false;
        error = true;
        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }
}
