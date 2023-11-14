import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppStyles.dart';

double _kDateSheetHeight = 315;
double _kTimeSheetHeight = 212;
double _kPickerBorder = 20;

class PetsTimePicker extends StatelessWidget {
  final Duration? value;
  final bool? showIcon;
  final Color? backgroundColor;
  final String? title;
  final void Function(Duration? value)? onSelectime;
  final void Function(DateTime? value)? onSelecteDate;
  final Duration? timeSelected;
  final DateTime? dateSelected;
  final TextStyle? textStyle;
  final String text;
  final bool? disable;
  final Duration? initTime;
  const PetsTimePicker({
    Key? key,
    this.value,
    this.showIcon,
    this.backgroundColor,
    this.title,
    required this.text,
    this.timeSelected,
    this.onSelectime,
    this.onSelecteDate,
    this.dateSelected,
    this.textStyle,
    this.disable,
    this.initTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int flex = 1;
    final DateFormat targetDateFormat = DateFormat('dd/MM/YYYY');
    return GestureDetector(
      onTap: (() {
        disable ?? false ? () {} : _showTimePicker(context);
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 51,
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: backgroundColor ?? Colors.white,
                  border: Border.all(
                    color: AppColors.border,
                    width: 1,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: flex,
                    child: Text(
                      dateSelected == null
                          ? text
                          : targetDateFormat.format(dateSelected!),
                      style: textStyle ?? AppStyles.blackRegularS16,
                    ),
                  ),
                  dateSelected == null
                      ? (showIcon ?? true
                          ? const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                FlutterRemix.time_line,
                                size: 20,
                              ),
                            )
                          : const SizedBox())
                      : const SizedBox()
                ],
              )),
        ],
      ),
    );
  }

  _showTimePicker(BuildContext context) async {
    DateTime? result;
    await CupertinoRoundedDatePicker.show(
      context,
      borderRadius: _kPickerBorder,
      textColor: AppColors.dark,
      minimumYear: 1900,
      initialDatePickerMode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (newDateTime) {
        result = newDateTime;
      },
      constraints: BoxConstraints(maxHeight: _kTimeSheetHeight),
    );
    if (result != null) {
      onSelecteDate?.call(result);
    }
  }
}
