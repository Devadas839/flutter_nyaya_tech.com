import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/pages/login_page/empty_case/empty_case_widget.dart';
import 'package:nyaya_tech/pages/login_page/logs/cases/cases_model.dart';
import 'package:nyaya_tech/components/case_card_widget.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class CasesWidget extends StatefulWidget {
  const CasesWidget({super.key});

  @override
  State<CasesWidget> createState() => _CasesWidgetState();
}

class _CasesWidgetState extends State<CasesWidget> {
  late CasesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CasesModel());
  }

  Future<void> fetchdata() async {
    await _model.fetchCaseData();
    await _model.fetchCasesIssue();
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
        floatingActionButton: SharedPrefernce.getUsertype() == 'user' ||
                _model.caseData.isNotEmpty
            ? FloatingActionButton.extended(
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('New Case',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DM Sans',
                        fontSize: 16)),
                backgroundColor: Color(0XFF000000),
                onPressed: () {
                  Get.toNamed(Routes.step1);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
              )
            : Container(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/Nyaya_logo.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                  child: FutureBuilder(
                      future: fetchdata(),
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
                          return _model.caseData.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _model.caseData.length,
                                  itemBuilder: (contex, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: CaseCardWidget(
                                        casedata: _model.caseData[index],
                                      ),
                                    );
                                  })
                              : EmptyCaseWidget(text: 'New Case.');
                        }
                      })),
            ].divide(SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
