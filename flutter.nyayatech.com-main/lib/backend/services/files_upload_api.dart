import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';

class FilesUploadApi {
  Future<CustomResponse<DocumentsUploadResponse>> call(
      {required FileUploadDto fildto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'File_upload_api',
      apiUrl: '',
      callType: ApiCallType.POST,
      headers: {'Authorization': SharedPrefernce.getAccessToken()},
      params: {},
      body: jsonEncode(fildto),
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            documentsUploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
