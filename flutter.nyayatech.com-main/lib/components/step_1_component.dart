import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class Step1Componentp extends StatelessWidget {
  final String text;
  final bool isSelected;
  const Step1Componentp(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF000000) : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 10),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/create_icon.svg',
                  height: 20,
                  width: 20,
                  color: isSelected ? Colors.white : Colors.black),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  text.toUpperCase(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Color(0xFF181616),
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
