import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/colors.dart';

Future<DateTime?> datePicker(BuildContext context, DateTime dateTime) =>
    showDatePicker(
      context: context,
      initialDate: dateTime,
      // firstDate: DateTime.now().subtract(const Duration(days: 14)),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              background: Colors.white,
              primary: cPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
