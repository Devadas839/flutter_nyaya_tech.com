import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class TextFeild_DatePicker extends StatefulWidget {
  final TextEditingController? dateController;
  final DateTime? firstDate;
  final DateTime? lastDate;
  DateTime? initialDate;
  final Function(String)? dateCallback;
  final String lable;
  final String? errorKey;
  final dynamic errors;
  TextFeild_DatePicker({
    super.key,
    required this.dateController,
    required this.lable,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.errorKey,
    this.errors,
    this.dateCallback,
  });

  @override
  State<TextFeild_DatePicker> createState() => _TextFeild_DatePickerState();
}

class _TextFeild_DatePickerState extends State<TextFeild_DatePicker> {
  @override
  bool haserrorKey() {
    if (widget.errors != null) {
      return true;
    }
    return false;
  }

  String result() {
    if (haserrorKey()) {
      var data = widget.errors;
      return error(data, widget.errorKey);
    }
    return '';
  }

  String error(Map<String, dynamic> instance, String? errork) {
    for (var entries in instance.entries) {
      if (entries.key == errork) {
        return entries.value ?? '';
      }
    }
    return '';
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            widget.lable,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'DM Sans'),
          ),
        ),
        GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: widget.initialDate ?? DateTime.now(),
                firstDate: widget.firstDate == null
                    ? DateTime(2000)
                    : widget.firstDate!,
                lastDate:
                    widget.lastDate == null ? DateTime(2050) : widget.lastDate!,
              );
              if (pickedDate != null) {
                DateTime currentTime = DateTime.now();
                pickedDate = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  currentTime.hour,
                  currentTime.minute,
                  currentTime.second,
                );
                String formatedDate =
                    DateFormat("yyyy-MM-dd").format(pickedDate.toLocal());
                String dateofProcurement =
                    DateFormat("yyy-MM-dd hh:mm:ss").format(pickedDate.toUtc());
                setState(() {});
                widget.dateController.text = formatedDate;
                widget.dateCallback!(dateofProcurement);
              }
            },
            child: AbsorbPointer(
                child: Container(
              color: Color(0xFFF3F9FF),
              height: 55,
              child: TextFormField(
                controller: widget.dateController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black),
                  hintText: 'Select Date',
                  helperStyle: TextStyle(color: Color(0XFF555555)),
                  prefixIcon:
                      Icon(Icons.calendar_today, color: Color(0XFF000000)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
              ),
            ))),
        if (result().isNotEmpty && result().toString() != null)
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 5.0),
            child: Text(
              result(),
              style: TextStyle(
                  color: const Color((0xffff3d34)),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
      ],
    );
  }
}
