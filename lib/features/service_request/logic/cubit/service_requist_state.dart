import 'package:herafy/features/service_request/data/best_tech_model.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';

abstract class ServiceRequestState {}

class ServiceRequestInitial extends ServiceRequestState {}

class ServiceRequestLoading extends ServiceRequestState {}

class ServiceRequestSuccess extends ServiceRequestState {
  final List<BestTechnicalModel> technicians;
  final SortType selectedSort;

  ServiceRequestSuccess({
    required this.technicians,
    required this.selectedSort,
  });
}

class ServiceRequestError extends ServiceRequestState {
  final String message;

  ServiceRequestError(this.message);
}