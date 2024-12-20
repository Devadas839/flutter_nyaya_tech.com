import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/date_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/pages/login_page/add_hearing_summary/add_hearing_summary_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';

class AddHearingSummaryWidget extends StatefulWidget {
  const AddHearingSummaryWidget({super.key});

  @override
  State<AddHearingSummaryWidget> createState() =>
      _AddHearingSummaryWidgetState();
}

class _AddHearingSummaryWidgetState extends State<AddHearingSummaryWidget> {
  late AddHearingSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddHearingSummaryModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  String date = '';

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          _model.textController1!.clear();
                          _model.textController2!.clear();
                        },
                        child: Icon(Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24),
                      ),
                    ),
                  ),
                  Text(
                    'Add Hearing Summary',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: Color(0xFF181616),
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
              Container(
                width: double.infinity,
                child: TextFeild_DatePicker(
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    dateCallback: (value) {
                      SharedPrefernce.setSummary(date = value);
                    },
                    dateController: _model.textController1!,
                    lable: '',
                    errorKey: 'date',
                    errors: _model.errorInstance),
              ),
              Flexible(
                child: Container(
                    width: double.infinity,
                    child: DescriptionTextField(
                      lable: '',
                      controller: _model.textController2!,
                      errors: _model.errorInstance1,
                      hintText: 'Summary',
                      errorKey: 'note',
                      color: Colors.black,
                      fillcolor: Color(0XFFF3F9FF),
                    )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.fetchAddSummary(
                              caseid: SharedPrefernce.getcaseId(),
                              date: _model.textController1.text.trim(),
                              note: _model.textController2.text.trim());
                          setState(() {});
                          if (!_model.error && _model.message.isNotEmpty) {
                            Get.toNamed(Routes.summary);
                            _model.textController1!.clear();
                            _model.textController2!.clear();
                          }
                        },
                        text: 'Save',
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                              EdgeInsetsDirectional.fromSTEB(46, 10, 46, 10),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500),
                          elevation: 0,
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16)),
                ),
              ),
            ].divide(SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
