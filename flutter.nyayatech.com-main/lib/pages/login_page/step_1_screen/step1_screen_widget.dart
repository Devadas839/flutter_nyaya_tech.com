import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/components/step_1_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/second_bottombar.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/step_1_screen/step1_screen_model.dart';

class Step1ScreenWidget extends StatefulWidget {
  const Step1ScreenWidget({super.key});

  @override
  State<Step1ScreenWidget> createState() => _Step1ScreenWidgetState();
}

class _Step1ScreenWidgetState extends State<Step1ScreenWidget> {
  late Step1ScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step1ScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataList = SharedPrefernce.getDataList();
    final uniqueDataList = dataList
        .where((item) =>
            item['service_title'] != null &&
            item['service_title'] != 'Dummy Service' &&
            item['service_title'] != '')
        .toList();

    final deduplicatedDataList =
        uniqueDataList.fold<List<Map<String, dynamic>>>([], (result, current) {
      if (!result
          .any((item) => item['service_title'] == current['service_title'])) {
        result.add(current);
      }
      return result;
    });

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0XFFFFFFFF),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                                        '1',
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
                                        'Step 1/3',
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
                            'Select Service',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFFCA8A03),
                                  letterSpacing: 0,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Icon(Icons.arrow_downward_outlined,
                              color: Color(0xFFCA8A03), size: 24),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: ListView.builder(
                            itemCount: deduplicatedDataList.length,
                            itemBuilder: (context, index) {
                              final serviceTitle =
                                  deduplicatedDataList[index]['service_title'];
                              final isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    SharedPrefernce.setservicetitle(
                                        serviceTitle!);
                                    print(
                                        'data == ${SharedPrefernce.getservicetitle()}');
                                  });
                                  if (SharedPrefernce.getservicetitle()
                                      .isNotEmpty) {
                                    if (SharedPrefernce.getservicetitle() ==
                                            'Not satisfied with the service of my existing lawyer' ||
                                        SharedPrefernce.getservicetitle() ==
                                            'Judgement came against me, What are my remedies? ') {
                                      Get.toNamed(Routes.description);
                                    } else {
                                      Get.toNamed(Routes.step2);
                                    }
                                  }
                                },
                                child: Step1Componentp(
                                  text: serviceTitle.toString(),
                                  isSelected: isSelected,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12)).around(SizedBox(height: 12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
