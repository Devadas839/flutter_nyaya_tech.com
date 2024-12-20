import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/components/step_3_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/step_3_screen/step3_screen_model.dart';

class Step3ScreenWidget extends StatefulWidget {
  const Step3ScreenWidget({super.key});

  @override
  State<Step3ScreenWidget> createState() => _Step3ScreenWidgetState();
}

class _Step3ScreenWidgetState extends State<Step3ScreenWidget> {
  late Step3ScreenModel _model;
  int? selectedIndex;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step3ScreenModel());
    print('case type == ${SharedPrefernce.getcasetitle()}');
  }

  List<Map<String, dynamic>> getIssuesForCaseTypeAndService(
      String caseType, String serviceTitle) {
    final dataList = SharedPrefernce.getDataList();
    return dataList
        .where((item) =>
            item['case_type']?.toString().toLowerCase().trim() ==
                caseType.toLowerCase().trim() &&
            item['service_title']?.toString().toLowerCase().trim() ==
                serviceTitle.toLowerCase().trim() &&
            item['issue_title'] != null &&
            item['issue_title']!.toString().isNotEmpty)
        .fold<List<Map<String, dynamic>>>([], (result, current) {
      if (!result
          .any((item) => item['issue_title'] == current['issue_title'])) {
        result.add(current);
      }
      return result;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCaseType = SharedPrefernce.getcasetitle();
    final selectedServiceTitle = SharedPrefernce.getservicetitle();
    final issuesForCaseTypeAndService =
        getIssuesForCaseTypeAndService(selectedCaseType, selectedServiceTitle);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration:
                                            BoxDecoration(color: Colors.black),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 6, 16, 6),
                                          child: Text(
                                            '3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Step 3/3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFFCA8A03),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            'Type of Service',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF444444),
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 10)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 7)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Select An Issue',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFFCA8A03),
                                      letterSpacing: 0,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_downward_outlined,
                                color: Color(0xFFCA8A03),
                                size: 24,
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: issuesForCaseTypeAndService.length,
                              itemBuilder: (context, index) {
                                final issueTitle =
                                    issuesForCaseTypeAndService[index]
                                        ['issue_title'];
                                final isSelected = selectedIndex == index;
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        SharedPrefernce.setissuetitle(
                                            issueTitle);
                                      });
                                    },
                                    child: Step3Component(
                                      isSelected: isSelected,
                                      issues: issueTitle.toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 12))
                            .around(SizedBox(height: 12)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await _model.fetchAddCase(
                                    servicetitle:
                                        SharedPrefernce.getservicetitle(),
                                    caseType: SharedPrefernce.getcasetitle(),
                                    issuetitle:
                                        SharedPrefernce.getissuetitle());
                                setState(() {});
                                if (!_model.error &&
                                    _model.message.isNotEmpty) {
                                  Get.toNamed(Routes.assigneScreen);
                                  SharedPrefernce.setservicetitle('');
                                  SharedPrefernce.setcasetitle('');
                                  SharedPrefernce.setissuetitle('');
                                }
                              },
                              text: 'Submit request',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 10, 40, 10),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                        fontFamily: 'DM Sans',
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400),
                                elevation: 0,
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
