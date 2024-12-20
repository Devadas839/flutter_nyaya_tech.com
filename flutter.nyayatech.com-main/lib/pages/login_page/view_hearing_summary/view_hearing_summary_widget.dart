// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

// class ViewHearingSummaryWidget extends StatefulWidget {
//   const ViewHearingSummaryWidget({super.key});

//   @override
//   State<ViewHearingSummaryWidget> createState() =>
//       _ViewHearingSummaryWidgetState();
// }

// class _ViewHearingSummaryWidgetState extends State<ViewHearingSummaryWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//           body: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context)
//                                 .secondaryBackground,
//                             border: Border.all(color: Colors.black, width: 1),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Icon(Icons.arrow_back,
//                                 color: FlutterFlowTheme.of(context).primaryText,
//                                 size: 24),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color:
//                               FlutterFlowTheme.of(context).secondaryBackground,
//                           border: Border.all(color: Colors.black, width: 1),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Icon(Icons.help_outline_rounded,
//                               color: FlutterFlowTheme.of(context).primaryText,
//                               size: 24),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Container(
//                         width: 30,
//                         height: 30,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/images/view_notes_write.svg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Text(
//                         '06 Oct 2024',
//                         style: FlutterFlowTheme.of(context).bodyMedium.override(
//                               fontFamily: 'Plus Jakarta Sans',
//                               color: Color(0xFFEB5757),
//                               letterSpacing: 0,
//                             ),
//                       ),
//                     ].divide(SizedBox(width: 8)),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted.\n\n1.  One2. Two3. Three4. Four5. Five\n\nThe client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted, and negotiations for settlement are underway.The client has provided all necessary documents related to the accident. The police report and witness statements have been collected. The insurance company has been contacted.',
//                           style:
//                               FlutterFlowTheme.of(context).bodyMedium.override(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     letterSpacing: 0,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ].divide(SizedBox(height: 12)),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/view_hearing_summary/view_hearing_summary_model.dart';

class ViewHearingSummaryWidget extends StatefulWidget {
  const ViewHearingSummaryWidget({super.key});

  @override
  State<ViewHearingSummaryWidget> createState() =>
      _ViewHearingSummaryWidgetState();
}

class _ViewHearingSummaryWidgetState extends State<ViewHearingSummaryWidget> {
  late ViewHearingSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewHearingSummaryModel());
  }

  Future<void> fetchdat() async {
    await _model.fetchSummary();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.help_outline_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: fetchdat(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator(color: Colors.black));
                          } else if (snapshot.hasError) {
                            return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/no_internet.svg',
                                height: 100,
                                width: 100,
                              ),
                              Text('No-Connection',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        );
                          } else {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 40,
                                              height: 40,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: Image.network(
                                                  'assets/images/note_tite_pic.png',
                                                  fit: BoxFit.cover)),
                                          Text(
                                            DateFormat('dd MMM yyyy').format(
                                                _model.viewSummary!.date!
                                                    .toLocal()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0XFFEB5757)),
                                          )
                                        ].divide(SizedBox(width: 8)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${_model.viewSummary!.note}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                )
                              ].divide(SizedBox(height: 10)),
                            );
                          }
                        })
                  ].divide(SizedBox(height: 24)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      thickness: 2,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/edit.svg',
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Edit',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                      fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 42,
                          child: VerticalDivider(
                            thickness: 2,
                            color: Color(0XFFBEBEBE),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/delete.svg',
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Delete',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'DM Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
