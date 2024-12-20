import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';

class CommentBox extends StatelessWidget {
  final Commentdata commentData;
  const CommentBox({super.key, required this.commentData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.network('https://picsum.photos/seed/952/600',
              fit: BoxFit.cover),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              border: Border.all(color: Color(0x4A000000)),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
              child: Text(
                commentData.message.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: Color(0xFF181616),
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(width: 8)),
    );
  }
}
