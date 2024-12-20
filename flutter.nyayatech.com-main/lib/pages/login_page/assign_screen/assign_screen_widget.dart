import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/assign_screen/assign_screen_model.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class AssignScreenWidget extends StatefulWidget {
  const AssignScreenWidget({super.key});

  @override
  State<AssignScreenWidget> createState() => _AssignScreenWidgetState();
}

class _AssignScreenWidgetState extends State<AssignScreenWidget> {
  late AssignScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignScreenModel());
    Future.delayed(const Duration(seconds: 10), () {
      Get.toNamed(Routes.bottombar, arguments: {'currentIndex': 2});
    });
  }

  Future<void> fetchdata() async {
    await _model.fetchUser();
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
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/images/Done.png',
                                fit: BoxFit.contain),
                            // Lottie.asset(
                            // 'assets/lottie_animations/chekc.json',
                            // width: 150,
                            // height: 150,
                            // fit: BoxFit.cover)
                          ),
                        ],
                      ),
                      FutureBuilder(
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
                              return Column(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Done',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF219653),
                                                fontSize: 24,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Your service request is registered',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                                color: Color(0XFF444444),
                                                fontWeight: FontWeight.normal),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Our lawer ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    fontSize: 20,
                                                    letterSpacing: 0,
                                                    color: Color(0XFF181616),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${_model.user!.firstName} ${_model.user!.lastName} ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0xFFCA8A03),
                                                    fontSize: 20,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'will get in touch and assist you in the further proceedings',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0XFF181616),
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'DM Sans',
                                                  letterSpacing: 0),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                            '${_model.user!.profilePicDownloadUrl}',
                                            fit: BoxFit.cover),
                                      ),
                                    ].divide(SizedBox(height: 24)),
                                  ),
                                  SizedBox(height: 40),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          Get.toNamed(Routes.bottombar,
                                              arguments: {'currentIndex': 2});
                                        },
                                        text: 'Go Back to Cases',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: Colors.black,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
