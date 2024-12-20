import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyaya_tech/data_components/form_error_helper.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnable;
  Function(String)? onChanged;
  final TextInputType? textInputType;
  int? maxLine = 1;
  int? minLine = 1;
  String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isPasswordField;
  final String? lable;
  final String? errorKey;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic errors;
  final Color? color;
  CommentTextField(
      {super.key,
      this.hintText = 'Select',
      this.isEnable = true,
      this.onChanged,
      this.color,
      this.lable,
      this.errorKey,
      this.obscureText = false,
      this.suffixIcon,
      this.isPasswordField = false,
      this.errors,
      this.textInputType,
      required this.controller,
      this.maxLine,
      this.minLine,
      this.inputFormatters});

  String? message() {
    return FormErrorHelper(errors: errors).message(errorKey!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lable != null) ...{
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(lable!,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0XFF000000),
                    fontFamily: 'Inter')),
          )
        },
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          autofocus: true,
          readOnly: isEnable,
          maxLines: maxLine,
          minLines: minLine,
          obscureText: obscureText,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context)
                .labelMedium
                .override(fontFamily: 'Lato', letterSpacing: 0),
            hintText: hintText,
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Lato',
                letterSpacing: 0,
                color: const Color(0XFF000000).withOpacity(0.6)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error, width: 1),
                borderRadius: BorderRadius.circular(8)),
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.black,
            filled: true,
            fillColor: Colors.white,
            errorText: message(),
            errorStyle: const TextStyle(color: Colors.red),
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
          ),
          style: FlutterFlowTheme.of(context)
              .bodyMedium
              .override(fontFamily: 'Lato', letterSpacing: 0),
        ),
      ],
    );
  }
}
