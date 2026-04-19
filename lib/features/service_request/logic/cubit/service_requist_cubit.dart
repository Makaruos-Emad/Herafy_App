import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/service_request/data/best_tech_model.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';
import 'package:herafy/features/service_request/logic/cubit/service_requist_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  ServiceRequestCubit(List<BestTechnicalModel> initialList)
      : _allTechnicians = List.from(initialList),
        super(ServiceRequestState(
          selectedSort: SortType.topRated,
          technicians: _sortTechnicians(
            technicians: initialList,
            sortType: SortType.topRated,
          ),
        ));

  final List<BestTechnicalModel> _allTechnicians;

  void changeSort(SortType type) {
    final updatedList = _sortTechnicians(
      technicians: _allTechnicians,
      sortType: type,
    );

    emit(state.copyWith(
      selectedSort: type,
      technicians: updatedList,
    ));
  }

  static List<BestTechnicalModel> _sortTechnicians({
    required List<BestTechnicalModel> technicians,
    required SortType sortType,
  }) {
    final updatedList = List<BestTechnicalModel>.from(technicians);

    switch (sortType) {
      case SortType.topRated:
        updatedList.sort((a, b) => b.rating.compareTo(a.rating));
        return updatedList;

      case SortType.nearest:
        updatedList.sort((a, b) => a.distance.compareTo(b.distance));
        return updatedList;

      case SortType.lowestPrice:
        updatedList.sort((a, b) => a.workingPrice.compareTo(b.workingPrice));
        return updatedList;

      case SortType.availableNow:
        return updatedList.where((t) => t.isAvailable).toList();
    }
  }
}
