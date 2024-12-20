import 'package:flutter/material.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';

class FileComponent extends StatelessWidget {
  final Documents doc;
  const FileComponent({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    IconData fileIcon = Icons.insert_drive_file;
    Color backgroundColor = const Color(0x14003FE9);

    if (doc.fileType!.contains('pdf')) {
      fileIcon = Icons.picture_as_pdf;
      backgroundColor = Color(0XFFD7120A).withOpacity(0.1);
    } else if (doc.fileType!.contains('image')) {
      fileIcon = Icons.image;
      backgroundColor = Color(0XFF5C30CD).withOpacity(0.1);
    } else if (doc.fileType!.contains('text')) {
      fileIcon = Icons.text_snippet;
      backgroundColor = Color(0XFFFF5C00).withOpacity(0.1);
    } else if (doc.fileType!.contains('word')) {
      fileIcon = Icons.description;
      backgroundColor = Color(0XFF003FE9).withOpacity(0.1);
    }

    return InkWell(
      onTap: () {
        SharedPrefernce.setfileId(doc.id.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Use the dynamic background color
          border: Border.all(color: const Color(0x3B000000)),
        ),
        alignment: const AlignmentDirectional(0, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Icon(fileIcon, size: 48, color: Colors.blue),
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doc.filename.toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                  ),
                        ),
                      ),
                      const Icon(Icons.keyboard_control_sharp, size: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
