import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/service_request/models/check_request_args.dart';
import 'package:herafy/features/service_request/widget/adress_section_widget.dart';
import 'package:herafy/features/service_request/widget/date_time_section_widget.dart';
import 'package:herafy/features/service_request/widget/location_section_widget.dart';
class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState
    extends State<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController =
      TextEditingController();

  TimeOfDay? appointmentTime;
  DateTime? appointmentDate;
  Country? _selectedGovernorate;
  String? _selectedCenter;

  bool get canContinue =>
      _addressController.text.trim().isNotEmpty &&
      _selectedGovernorate != null &&
      _selectedCenter != null &&
      appointmentDate != null &&
      appointmentTime != null;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void submitToCheckScreen() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pushNamed(
      context,
      Routes.checkRequestScreen,
      arguments: CheckRequestArgs(
        time: appointmentTime!,
        date: appointmentDate!,
        address: _addressController.text.trim(),
        governorate: _selectedGovernorate!.title,
        center: _selectedCenter!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: "احجز موعدك",
        onpress: () => Navigator.pop(context),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.02 +
                MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CustomButton(
            onPressed: canContinue ? submitToCheckScreen : null,
            text: "حجز الموعد",
          ),
        ),
      ),

      
    body: SingleChildScrollView(
  child: Padding(
    padding: EdgeInsets.all(width * 0.05),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateTimeSection(
            onTimeChanged: (value) =>
                setState(() => appointmentTime = value),
            onDateChanged: (value) =>
                setState(() => appointmentDate = value),
          ),

          SizedBox(height: height * 0.04),

          LocationSection(
            selectedGovernorate: _selectedGovernorate,
            selectedCenter: _selectedCenter,
            onGovernorateSelected: (gov) {
              setState(() {
                _selectedGovernorate = gov;
                _selectedCenter = null;
              });
            },
            onCenterSelected: (center) =>
                setState(() => _selectedCenter = center),
          ),

          SizedBox(height: height * 0.04),

          if (_selectedCenter != null)
            AddressSection(
              controller: _addressController,
              onChanged: (_) => setState(() {}),
            ),

          SizedBox(height: height * 0.1),
        ],
      ),
    ),
  ),
),
    );
  }
}




