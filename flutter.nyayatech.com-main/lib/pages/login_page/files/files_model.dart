import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/case_dox_api.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';

class FilesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  dynamic errorInstance;
  bool error = false;
  String message = '';
  AppResponse? appResponse;
  List<Documents> documents = [];

  @override
  void dispose() {}

  Future<void> fetchuploadFiles({required String fileds}) async {
    FileUploadDto fileUploadDto = FileUploadDto(fields: fileds);

    CustomResponse<DocumentsUploadResponse> response =
        await FilesUploadApi().call(fildto: fileUploadDto);

    switch (response.statusCode) {
      case 200:
      case 201:
        error = false;
        message = '';
        break;
      case 422:
        error = true;
        message = '';
        break;
      default:
        error = true;
    }
  }

  Future<void> fetchDocx() async {
    CustomResponse<ListCaseDox> response = await CaseDoxApi().call();
    switch (response.statusCode) {
      case 200:
      case 201:
        documents = response.data!.data!.records!;
      case 422:
        error = true;
        message = response.message.toString();
        break;
      default:
        error = true;
    }
  }
}
