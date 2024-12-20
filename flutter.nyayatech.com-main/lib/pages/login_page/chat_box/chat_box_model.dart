import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/comments_api.dart';
import 'package:nyaya_tech/dtos/comments_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';
import 'package:nyaya_tech/response/post_commonts_response.dart';

class ChatBoxModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  bool error = false;
  String message = '';
  List<Commentdata> commentData=[];

  @override
  void dispose() {}

  Future<void> fetchPostComments({required String comments}) async {
    CommentsDto postCommetnsdto = CommentsDto(comments: comments);
    CustomResponse<PostCommentResponse> response =
        await PostCommentsApi().call(commentdto: postCommetnsdto);

    switch (response.statusCode) {
      case 200:
      case 201:
        error = false;
        message = response.data!.message.toString();
      case 422:
      default:
        error = true;
        message = response.data!.message!;
    }
  }

  Future<List<Commentdata>> fetchcomments() async {
    CustomResponse<AllcommentsResponse> response =
        await GetCommentsProcurementAPI().call();
    if (response.statusCode == 200) {
      commentData = response.data!.data!.data!;
      return commentData;
    } else {
      return [];
    }
  }
}
