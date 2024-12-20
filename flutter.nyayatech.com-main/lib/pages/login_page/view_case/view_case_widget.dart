import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/components/details_screen_widget.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login_page/view_case/help_line.dart';
import 'package:nyaya_tech/pages/login_page/view_case/view_case_model.dart';
import 'package:popover/popover.dart';

class ViewCaseWidget extends StatefulWidget {
  const ViewCaseWidget({super.key});

  @override
  State<ViewCaseWidget> createState() => _ViewCaseWidgetState();
}

class _ViewCaseWidgetState extends State<ViewCaseWidget> {
  late ViewCaseModel _model;
  String? selectedValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCaseModel());
    print("Data -- ${SharedPrefernce.getDataList()}");
  }

  Future<void> fetchdata() async {
    await _model.fetchViewCase();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          floatingActionButton: Builder(
            builder: (context) => Container(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {
                  showPopover(
                      context: context,
                      bodyBuilder: (context) => Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MenuItem(
                                    text: 'Case Details',
                                    color: Colors.white,
                                    ontap: () {}),
                                MenuItem(
                                  text: 'Files',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FilesWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Chat Box',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ChatBoxWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Notes',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: NotesScreenWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Hearing Summary',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: HearingSummaryWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Logs',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: LogsWidget()),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 16)),
                            ),
                          ),
                      direction: PopoverDirection.left,
                      width: 250,
                      height: 230,
                      arrowHeight: 15,
                      arrowWidth: 30,
                      backgroundColor: Colors.black);
                },
                backgroundColor: Colors.black,
                elevation: 8,
                child: Icon(Icons.menu_rounded, color: Colors.white, size: 32),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
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
                    } else {
                      String orginalText = '${_model.viewCase!.status}';
                      String formattedText = orginalText.replaceAll("_", " ");
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.bottombar,
                                          arguments: {'currentIndex': 2});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24),
                                      ),
                                    )),
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
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('assets/images/created.svg',
                                      height: 20, width: 20),
                                  Text(
                                    DateFormat('dd MMM yyyy').format(
                                        _model.viewCase!.createdAt!.toLocal()),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'DM Sans',
                                            color: Colors.black,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal),
                                  ),
                                ].divide(SizedBox(width: 8)),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: _model.viewCase!.description ==
                                                null
                                            ? Text(
                                                '${_model.viewCase!.issue!.issueTitle}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              )
                                            : Text(
                                                '${_model.viewCase!.description}',
                                                style: TextStyle(
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(0XFF000000)
                                                        .withOpacity(0.5)),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFEECC),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 8, 24, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '${_model.viewCase!.priority}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFFFF5C00),
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        // Icon(
                                        //   Icons.arrow_drop_down,
                                        //   color: FlutterFlowTheme.of(context)
                                        //       .primaryText,
                                        //   size: 24,
                                        // ),
                                      ].divide(SizedBox(width: 10)),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                        color: Color(0x33000000), width: 1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 8, 24, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          formattedText,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFFFF5C00),
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        // Icon(
                                        //   Icons.arrow_drop_down,
                                        //   color: FlutterFlowTheme.of(context)
                                        //       .primaryText,
                                        //   size: 24,
                                        // ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: Color(0xFFDBDBDB),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.all(14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset(
                                          'assets/images/Case_type.svg',
                                          width: 16,
                                          height: 16,
                                          fit: BoxFit.contain),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${_model.viewCase!.issue!.caseType}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12)),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFDBDBDB)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: SvgPicture.asset(
                                              'assets/images/Next_hearing.svg',
                                              width: 32,
                                              height: 32,
                                              fit: BoxFit.contain),
                                        ),
                                        Text(
                                          'Next Hearing',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          _model.viewCase!.nextHearingDate ==
                                                  null
                                              ? '--'
                                              : DateFormat('dd MMM yyyy')
                                                  .format(_model.viewCase!
                                                      .nextHearingDate!
                                                      .toLocal()),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'DM Sans',
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DetailsScreenWidget(
                              text:
                                  '${_model.viewCase!.lawyer!.firstName} ${_model.viewCase!.lawyer!.lastName}',
                              text1: '${_model.viewCase!.lawyer!.designation}',
                              text2: '${_model.viewCase!.lawyer!.phone}',
                              text4: '${_model.viewCase!.lawyer!.email}',
                              text3:
                                  '${_model.viewCase!.user!.firstName ?? '-'} ${_model.viewCase!.user!.lastName ?? '-'}',
                              text5: _model.viewCase!.user!.phone == null
                                  ? '--'
                                  : '${_model.viewCase!.user!.phone}',
                              text6: _model.viewCase!.user!.email ?? '--',
                              imageUrl1: _model.viewCase!.user!.profilePic ??
                                  'https://images.unsplash.com/photo-1640960543409-dbe56ccc30e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHx1c2VyfGVufDB8fHx8MTczNDM5MTUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
                              imageUrl:
                                  '${_model.viewCase!.lawyer!.profilePic}',
                            ),
                            HelpLineWidget(text: '1800-XXXX-XXXX')
                          ].divide(SizedBox(height: 20)),
                        ),
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
