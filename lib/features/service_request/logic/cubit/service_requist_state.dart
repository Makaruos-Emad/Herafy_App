import 'package:herafy/features/service_request/data/best_tech_model.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';

class ServiceRequestState {
  final SortType selectedSort;
  final List<BestTechnicalModel> technicians;

  ServiceRequestState({
    required this.selectedSort,
    required this.technicians,
  });

  ServiceRequestState copyWith({
    SortType? selectedSort,
    List<BestTechnicalModel>? technicians,
  }) {
    return ServiceRequestState(
      selectedSort: selectedSort ?? this.selectedSort,
      technicians: technicians ?? this.technicians,
    );
  }
}