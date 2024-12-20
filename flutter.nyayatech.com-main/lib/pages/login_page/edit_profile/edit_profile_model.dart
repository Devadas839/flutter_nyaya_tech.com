import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/dtos/update_user_dto.dart';
import 'package:nyaya_tech/response/update_user_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class AddUserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;
  dynamic errorInstance1;
  dynamic errorInstance2;
  dynamic errorinstance3;
  dynamic errorinstance4;
  dynamic errorinstance5;

  @override
  void dispose() {}

  Future<void> fetchUpdateUser(
      {required int userid,
      required String firstName,
      required String lastName,
      required String phone,
      required String dateofBirth,
      String? address,
      required String gender,
      required String email}) async {
    UpdateUserDto userDto = UpdateUserDto(
        userid: userid,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        dateofBirth: dateofBirth,
        gender: gender,
        address: address,
        email: email);
    CustomResponse<CreateuserResponse> response =
        await CreateUserApi().call(updateuser: userDto);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        error = false;
      case 422:
        error = true;
        message = response.data!.message.toString();
        isValidation = true;
        errorInstance = response.data!.errData != null
            ? {
                "first_name": response.data!.errData!.firstName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        errorinstance3 = response.data!.errData != null
            ? {
                "last_name": response.data!.errData!.lastName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "phone":
                    response.data!.errData!.phone?.join(', ') ?? "Unknow error"
              }
            : null;
        errorInstance2 = response.data!.errData != null
            ? {
                "date_of_birth":
                    response.data!.errData!.dateOfBirth?.join(', ') ??
                        "Unknow error"
              }
            : null;
        errorinstance5 = 
        response.data!.errData != null
            ? {
                "email":
                    response.data!.errData!.email?.join(', ') ?? "Unknow error"
              }
            : null;
      case 401:
        message = response.data!.message.toString();
        isValidation = true;
        error = true;
        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }
}
