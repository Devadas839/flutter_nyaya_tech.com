import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/date_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/pages/login_page/edit_profile/edit_profile_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  late AddUserModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  String date = '';
  String selectedGender = '';
  bool showGenderError = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddUserModel());
    controller4.text = SharedPrefernce.getcreatePhone();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Icon(Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 36),
                      ),
                    ),
                    Text(
                      'Add Profile',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            fontSize: 16,
                            letterSpacing: 0,
                          ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await _model.fetchUpdateUser(
                            userid: SharedPrefernce.getloginId(),
                            firstName: controller1.text.trim(),
                            lastName: controller2.text.trim(),
                            address: controller5.text.trim(),
                            phone: controller4.text.trim(),
                            dateofBirth: controller6.text.trim(),
                            gender: selectedGender,
                            email: controller3.text.trim());
                        setState(() {
                          isLoading = false;
                        });
                        if (!_model.error && _model.message.isNotEmpty) {
                          Get.toNamed(Routes.bottombar,
                              arguments: {'currentIndex': 2});
                        } else if (selectedGender.isEmpty) {
                          setState(() {
                            showGenderError = true;
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.black, strokeWidth: 2),
                              )
                            : SvgPicture.asset('assets/images/done_mark.svg',
                                width: 36, height: 36, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: TextFieldComponent(
                            controller: controller1,
                            errorKey: 'first_name',
                            errors: _model.errorInstance,
                            hintText: 'First Name',
                            label: 'First Name',
                            maxLine: 1,
                          ),
                        ),
                        Flexible(
                          child: TextFieldComponent(
                              controller: controller2,
                              hintText: 'Last Name',
                              label: 'Last Name',
                              errors: _model.errorinstance3,
                              maxLine: 1,
                              errorKey: 'last_name'),
                        ),
                      ].divide(SizedBox(width: 16)),
                    ),
                    Flexible(
                      child: TextFieldComponent(
                          controller: controller3,
                          errorKey: 'email',
                          errors: _model.errorinstance5,
                          hintText: 'Email',
                          label: 'Email',
                          maxLine: 1),
                    ),
                    Flexible(
                      child: TextFieldComponent(
                          controller: controller4,
                          hintText: 'Phone',
                          label: 'Phone',
                          maxLine: 1,
                          errors: _model.errorInstance1,
                          errorKey: 'phone'),
                    ),
                    Flexible(
                      child: DescriptionTextField(
                        controller: controller5,
                        hintText: 'Residential Address',
                        color: Colors.black,
                        lable: 'Residential Address',
                        errorKey: 'address',
                      ),
                    ),
                    Flexible(
                      child: TextFeild_DatePicker(
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2011),
                        initialDate: DateTime(2011),
                        lable: 'Date Of Birth',
                        dateController: controller6,
                        dateCallback: (value) {
                          SharedPrefernce.setSummary(date = value);
                        },
                        errorKey: 'date_of_birth',
                        errors: _model.errorInstance2,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              color: Color(0XFF828282)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _genderContainer('male', 'Male'),
                        _genderContainer('female', 'Female'),
                        _genderContainer('other', 'Other'),
                      ],
                    ),
                    // if (showGenderError) ...[
                    //   SizedBox(height: 8),
                    //   Text(
                    //     'Please select a gender',
                    //     style: TextStyle(color: Colors.red, fontSize: 12),
                    //   ),
                    // ],
                  ].divide(SizedBox(height: 16)),
                ),
              ].divide(SizedBox(height: 32)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderContainer(String gender, String label) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
          showGenderError = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: isSelected ? Color(0XFFE0E0E0) : Colors.white,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(fontFamily: 'DM Sans', color: Color(0XFF181616)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
