import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/update_user_dto.dart';
import 'package:nyaya_tech/response/assigne_response.dart';
import 'package:nyaya_tech/response/update_user_response.dart';

class CreateUserApi {
  Future<CustomResponse<CreateuserResponse>> call(
      {required UpdateUserDto updateuser}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Update_user',
        apiUrl: buildUrl('/users/${SharedPrefernce.getloginId()}'),
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(updateuser),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            createuserResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ProfileApi {
  Future<CustomResponse<AssigneResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Profile_api',
        apiUrl: buildUrl('/users/${SharedPrefernce.getprofileid()}'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
        
    return CustomResponse.completed(
        await compute(assigneResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
