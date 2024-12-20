import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/list_issues_api.dart';
import 'package:nyaya_tech/backend/services/login_api.dart';
import 'package:nyaya_tech/backend/services/verfication_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/pages/login_page/otp_page/otp_page_widget.dart';
import 'package:nyaya_tech/response/list_issues_response.dart';
import 'package:nyaya_tech/response/mail_response.dart';
import 'package:nyaya_tech/response/send_otp_response.dart';



class MobileLoginOtpModel extends FlutterFlowModel<MobileLoginOtpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;


  String message = '';
  bool error = false;
  bool isValidation = false;
  AppResponse? appResponse;
  dynamic errorInstance;
  List<Issues> issues = [];

  


  

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }


  Future<void> fetchotp({required String email, required String otp}) async {
    CustomResponse<OtpResponse> response =
        await VerficationApi().call(email: email, otp: otp);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        SharedPrefernce.setAccessToken(
            response.data!.data!.accessToken.toString());
        SharedPrefernce.setUsertype(
            response.data!.data!.userDetails!.userType.toString());
        SharedPrefernce.setisNewUser(
            response.data!.data!.userDetails!.isNewUser ?? false);
        SharedPrefernce.setloginId(
            response.data!.data!.userDetails!.id!.toInt());
        SharedPrefernce.setcreatePhone(
            response.data!.data!.userDetails!.phone.toString());
        SharedPrefernce.setprofileid(
            response.data!.data!.userDetails!.id!.toInt());
        break;
      case 422:
        message = response.data!.message.toString();
        isValidation = false;
        error = true;
        errorInstance = response.data?.errData?.otp != null
            ? (String? pinCode) {
                if (pinCode == null || pinCode.isEmpty) {
                  return response.data!.errData!.otp?.join(', ') ??
                      "Unknown error";
                }
                return null;
              }
            : null;

        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }

  Future<void> fetchsendOtp({required String title}) async {
    print("line 27");
    try {
      CustomResponse<SendOtpResponse> response =
          await SendOtpApi().call(title: title);
      error = false;
      isValidation = false;
      switch (response.statusCode) {
        case 200:
        case 201:
          message = response.data!.message.toString();
          error = false;
          break;
        case 404:
          message = response.data!.message.toString();
          error = true;
          isValidation = true;
          break;
        default:
          message = response.data!.message.toString();
          error = true;
          break;
      }
    } catch (e) {
      error = true;
      print("line $e");
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
