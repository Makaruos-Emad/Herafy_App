import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';
import 'package:herafy/features/service_request/logic/cubit/service_requist_cubit.dart';
import 'package:herafy/features/service_request/widget/select_tech_screen_body.dart';

class SelectTechnicianScreen extends StatelessWidget {
  const SelectTechnicianScreen({super.key, required this.serviceId});
  final int serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceRequestCubit(ApiService(), serviceId)
        ..getTechnicians(SortType.topRated),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "أفضل السباكين",
          onpress: () {
            Navigator.pop(context);
          },
        ),
        body: SelectTechnicialBody(),
      ),
    );
  }
}
