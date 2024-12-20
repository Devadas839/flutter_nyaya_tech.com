import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/view_notes/view_notes_model.dart';

class ViewNotesWidget extends StatefulWidget {
  const ViewNotesWidget({super.key});

  @override
  State<ViewNotesWidget> createState() => _ViewNotesWidgetState();
}

class _ViewNotesWidgetState extends State<ViewNotesWidget> {
  late ViewNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewNotesModel());
  }

  Future<void> fetchdata() async {
    await _model.fetchviewNotes();
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
                child: FutureBuilder(
                    future: fetchdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator(color: Colors.black));
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
                      } else if (snapshot.hasData) {
                        return Center(child: Text('Somthing Went Wrong'));
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.help_outline_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
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
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '${_model.viewNotes!.title}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                  Text(
                                                    DateFormat('dd MMM yyyy')
                                                        .format(_model
                                                            .viewNotes!
                                                            .createdAt!
                                                            .toLocal()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            color: Color(
                                                                0XFFEB5757)),
                                                  )
                                                ].divide(SizedBox(height: 6)),
                                              ),
                                            )
                                          ].divide(SizedBox(width: 6)),
                                        ),
                                      ),
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
                                                'https://picsum.photos/seed/690/600',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              '${_model.viewNotes!.createdByName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily:
                                                              'DM Sans'),
                                            )
                                          ].divide(SizedBox(width: 10)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${_model.viewNotes!.note}',
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
                              ),
                            ].divide(SizedBox(height: 24)),
                          ),
                        );
                      }
                    })),
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
