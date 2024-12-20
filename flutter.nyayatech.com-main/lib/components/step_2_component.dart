import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class Step2Component extends StatelessWidget {
  final bool isSelected;
  final String text1;
  const Step2Component(
      {super.key, required this.isSelected, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isSelected
              ? Colors.black
              : FlutterFlowTheme.of(context).secondaryBackground),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset('assets/images/create_icon.svg',
                height: 20,
                width: 20,
                color: isSelected ? Colors.white : Colors.black),
            Expanded(
              child: Text(
                text1.toString().toUpperCase(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: isSelected ? Colors.white : Color(0xFF181616),
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ].divide(SizedBox(width: 12)),
        ),
      ),
    );
  }
}
