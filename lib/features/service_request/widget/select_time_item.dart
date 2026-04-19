import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class SelectTime extends FormField<TimeOfDay> {
  SelectTime({
    super.key,
    super.onSaved,
    super.initialValue,
    super.autovalidateMode,
    this.onChanged,
    FormFieldValidator<TimeOfDay>? validator,
  }) : super(
         validator:
             validator ??
             (value) {
               if (value == null) {
                 return "اختر الوقت";
               }
               return null;
             },
         builder: (field) {
           final context = field.context;
           final pickedTime = field.value;
           final text = pickedTime == null
               ? "اختر الوقت"
               : pickedTime.format(context);
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
                   padding: const EdgeInsets.symmetric(horizontal: 12),
                 ),
                 onPressed: () async {
                   final selected = await showTimePicker(
                     context: context,
                     initialTime: pickedTime ?? TimeOfDay.now(),
                   );

                   if (selected != null) {
                     field.didChange(selected);
                     onChanged?.call(selected);
                     debugPrint("Selected time: ${selected.format(context)}");
                   }
                 },
                 child: SizedBox(
                   height: 50,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(
                         Icons.access_time,
                         color: AppColors.primaryColor,
                         size: 20,
                       ),
                       const SizedBox(width: 8),
                       Text(text, style: AppTextStyles.regular16Black),
                       const SizedBox(width: 8),
                       const Icon(
                         Icons.expand_more,
                         color: Colors.black,
                         size: 20,
                       ),
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

  final ValueChanged<TimeOfDay?>? onChanged;
}
