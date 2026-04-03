import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';

class SelectDate extends FormField<DateTime> {
  SelectDate({
    super.key,
    super.onSaved,
    super.initialValue,
    super.autovalidateMode,
    this.onChanged,
    FormFieldValidator<DateTime>? validator,
  }) : super(
         validator:
             validator ??
             (value) {
               if (value == null) {
                 return "اختر التاريخ";
               }
               return null;
             },
         builder: (field) {
           final context = field.context;
           final pickedDate = field.value;
           final text = pickedDate == null
               ? "اختر التاريخ"
               : DateFormat('d MMMM yyyy', 'ar').format(pickedDate);
           final borderColor = field.hasError
               ? Colors.red
               : AppColors.primaryColor;

           return Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             mainAxisSize: MainAxisSize.min,
             children: [
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                     side: BorderSide(color: borderColor, width: 2),
                   ),
                 ),
                 onPressed: () async {
                   final now = DateTime.now();
                   final selected = await showDatePicker(
                     context: context,
                     initialDate: pickedDate ?? now,
                     firstDate: now,
                     lastDate: DateTime(2100),
                   );

                   if (selected != null) {
                     field.didChange(selected);
                     onChanged?.call(selected);
                     debugPrint(
                       "Selected date: ${DateFormat('d MMMM yyyy', 'ar').format(selected)}",
                     );
                   }
                 },
                 child: SizedBox(
                   height: 50,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(
                         Icons.calendar_today,
                         color: AppColors.primaryColor,
                         size: 20,
                       ),
                       const SizedBox(width: 10),
                       Text(text, style: AppTextStyles.regular16Black),
                       const SizedBox(width: 10),
                       const Icon(Icons.expand_more, color: Colors.black),
                     ],
                   ),
                 ),
               ),
               if (field.hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 6, left: 12, right: 12),
                   child: Text(
                     field.errorText ?? "",
                     style: const TextStyle(color: Colors.red, fontSize: 12),
                     maxLines: 2,
                   ),
                 ),
             ],
           );
         },
       );

  final ValueChanged<DateTime?>? onChanged;
}
