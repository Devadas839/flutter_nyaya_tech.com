import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';

class CaseDoxApi {
  Future<CustomResponse<ListCaseDox>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Case_dox',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/docs'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(listCaseDoxFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
