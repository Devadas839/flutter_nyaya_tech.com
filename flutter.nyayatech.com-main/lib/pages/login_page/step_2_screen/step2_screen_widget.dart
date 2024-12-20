import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/components/step_2_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/step_3_screen/step3_screen_model.dart';

class Step2ScreenWidget extends StatefulWidget {
  const Step2ScreenWidget({super.key});

  @override
  State<Step2ScreenWidget> createState() => _Step2ScreenWidgetState();
}

class _Step2ScreenWidgetState extends State<Step2ScreenWidget> {
  late Step3ScreenModel _model;
  int? selectedIndex;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step3ScreenModel());
    print('service title -- ${SharedPrefernce.getservicetitle()}');
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataList = SharedPrefernce.getDataList();

    final String selectedServiceTitle = SharedPrefernce.getservicetitle();

    final filteredCaseList = dataList
        .where((item) =>
            item['service_title']?.toString().toLowerCase().trim() ==
                selectedServiceTitle.toLowerCase().trim() &&
            item['case_type'] != null &&
            item['case_type']!.toString().isNotEmpty)
        .toList();

    final deduplicatedCaseList =
        filteredCaseList.fold<List<Map<String, dynamic>>>(
      [],
      (result, current) {
        if (!result.any((item) => item['case_type'] == current['case_type'])) {
          result.add(current);
        }
        return result;
      },
    );
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFFFFFFF),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
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
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 6, 16, 6),
                                      child: Text(
                                        '2',
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
                                        'Step 2/3',
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
                                              fontFamily: 'Plus Jakarta Sans',
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
                            'Select Case Type',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: const Color(0xFFCA8A03),
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          const Icon(Icons.arrow_downward_outlined,
                              color: Color(0xFFCA8A03), size: 24),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: deduplicatedCaseList.length,
                          itemBuilder: (context, index) {
                            final caseTitle =
                                deduplicatedCaseList[index]['case_type'];
                            final isSelected = selectedIndex == index;
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    SharedPrefernce.setcasetitle(caseTitle);
                                    print(
                                        'data == ${SharedPrefernce.getcasetitle()}');
                                  });
                                  if (SharedPrefernce.getcasetitle() ==
                                          'Other Issues' ||
                                      SharedPrefernce.getcasetitle() ==
                                          'Criminal Case') {
                                    Get.toNamed(Routes.otherissue);
                                  } else if (SharedPrefernce.getcasetitle() ==
                                      'Human Rights Violation / PIL / Against Government') {
                                  } else if (SharedPrefernce.getcasetitle()
                                      .isNotEmpty) {
                                    Get.toNamed(Routes.step3);
                                  }
                                },
                                child: Step2Component(
                                  isSelected: isSelected,
                                  text1: caseTitle.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 12))
                        .around(const SizedBox(height: 12)),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (SharedPrefernce.getcasetitle() ==
                          'Human Rights Violation / PIL / Against Government' ||
                      SharedPrefernce.getcasetitle() == 'Criminal Case')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await _model.fetchAddCase(
                                servicetitle: SharedPrefernce.getservicetitle(),
                                caseType: SharedPrefernce.getcasetitle(),
                                issuetitle: SharedPrefernce.getcasetitle(),
                              );
                              setState(() {});
                              if (!_model.error && _model.message.isNotEmpty) {
                                Get.toNamed(Routes.assigneScreen);
                                SharedPrefernce.setservicetitle('');
                                SharedPrefernce.setcasetitle('');
                                SharedPrefernce.setissuetitle('');
                              }
                            },
                            text: 'Submit request',
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  40, 10, 40, 10),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: Colors.black,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                              elevation: 0,
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ].divide(const SizedBox(width: 16)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
