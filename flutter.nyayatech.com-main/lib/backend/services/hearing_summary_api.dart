import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/add_summary_notes.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';
import 'package:nyaya_tech/response/post_hearing_summary_response.dart';
import 'package:nyaya_tech/response/view_summary_response.dart';

class GetHearingSummaryApi {
  Future<CustomResponse<CaseSummaryResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Get_hearing_summary',
        apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/summary'),
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
        await compute(
            caseSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class PostHearingSummaryApi {
  Future<CustomResponse<PostCasesSummaryResponse>> call(
      {required AddSummarydto adsummartdto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Post_Summary_api',
        apiUrl: buildUrl('/summary'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(adsummartdto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            postCasesSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewSummaryApi {
  Future<CustomResponse<ViewSummaryResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'View_summary_api',
        apiUrl: buildUrl('/summary/${SharedPrefernce.getsummaryid()}'),
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
        await compute(
            viewSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
