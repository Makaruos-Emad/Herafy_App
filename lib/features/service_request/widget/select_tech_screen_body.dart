import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';
import 'package:herafy/features/service_request/logic/cubit/service_requist_cubit.dart';
import 'package:herafy/features/service_request/logic/cubit/service_requist_state.dart';
import 'package:herafy/features/service_request/widget/best_tech_items.dart';



class SelectTechnicialBody extends StatelessWidget {
  const SelectTechnicialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
      builder: (context, state) {
        final cubit = context.read<ServiceRequestCubit>();
    
        final items = [
          SortItem(title: "الأعلى تقييمًا", type: SortType.topRated),
          SortItem(title: "الأقرب", type: SortType.nearest),
          SortItem(title: "الأقل سعرًا", type: SortType.lowestPrice),
          SortItem(title: "متاح الآن", type: SortType.availableNow),
        ];
    
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                final isSelected = state.selectedSort == item.type;
    
                return GestureDetector(
                  onTap: () {
                    cubit.changeSort(item.type);
                  },
                  child: Column(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 5),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 2,
                        width: isSelected ? 40 : 0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.technicians.length,
                itemBuilder: (context, index) {
                  return BestTechItems(
                    bestTechnical: state.technicians[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
