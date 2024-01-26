import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_label.dart';
import 'package:quiver/time.dart';

class FormDateDropdown extends HookWidget {
  const FormDateDropdown({
    super.key,
    this.label,
    this.value,
    this.validator,
    this.isRequired = false,
    this.backgroundColor = AppColors.white,
    this.onChanged,
  });

  final String? label;
  final DateTime? value;
  final String? Function(DateTime?)? validator;
  final bool isRequired;
  final Color? backgroundColor;
  final void Function(DateTime?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final year = useState<int?>(value?.year);
    final month = useState<int?>(value?.month);
    final day = useState<int?>(value?.day);

    Map<int?, String> getYears() {
      return {
        null: 'Year',
        ...{for (final year in List.generate(100, (index) => DateTime.now().year - index)) year: year.toString()},
      };
    }

    Map<int?, String> getMonths() {
      return {
        null: 'Month',
        1: 'January',
        2: 'February',
        3: 'March',
        4: 'April',
        5: 'May',
        6: 'June',
        7: 'July',
        8: 'August',
        9: 'September',
        10: 'October',
        11: 'November',
        12: 'December',
      };
    }

    Map<int?, String> getDays() {
      Map<int?, String> days = {null: 'Day'};

      if (year.value != null && month.value != null) {
        days.addAll({
          for (final day in Iterable<int>.generate(daysInMonth(year.value!, month.value!))) (day + 1): (day + 1).toString(),
        });
      }

      return days;
    }

    void onDateChanged(String? value, ValueNotifier<int?> type) {
      type.value = value.isNullOrEmpty ? null : int.parse(value!);

      if (year.value == null || month.value == null || !getDays().containsValue(day.value.toString())) {
        day.value = null;
      }

      DateTime? dateTime;
      if (year.value != null && month.value != null && day.value != null) {
        dateTime = DateTime(year.value!, month.value!, day.value!);
      }

      if (onChanged != null) {
        onChanged!(dateTime);
      }
    }

    DropdownButtonFormField buildDropdown(Map<int?, String> options, ValueNotifier<int?> type) {
      return DropdownButtonFormField(
        menuMaxHeight: 250,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.gray300,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            borderSide: BorderSide(width: 1, color: AppColors.gray300),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: backgroundColor,
        ),
        value: options.containsKey(type.value) ? type.value?.toString() : null,
        onChanged: (value) => onDateChanged(value, type),
        items: options.entries.map((entry) {
          return DropdownMenuItem<String?>(
            value: entry.key?.toString(),
            child: Text(
              entry.value,
              style: AppStyles.body,
            ),
          );
        }).toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          FormLabel(
            label: label,
            isRequired: isRequired,
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: buildDropdown(getYears(), year),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 3,
              child: buildDropdown(getMonths(), month),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: buildDropdown(getDays(), day),
            ),
          ],
        ),
        TextFormField(
          validator: (_) => validator!(value),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero, // Set content padding to zero
            isCollapsed: true, // Remove vertical padding
            border: InputBorder.none, // Remove border
          ),
          style: const TextStyle(fontSize: 0),
        ),
      ],
    );
  }
}
