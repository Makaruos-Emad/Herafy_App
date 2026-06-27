import 'package:equatable/equatable.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';

abstract class TechnicianOrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TechnicianOrdersInitial extends TechnicianOrdersState {}

class TechnicianOrdersLoading extends TechnicianOrdersState {}

class TechnicianOrdersSuccessSplit extends TechnicianOrdersState {
  final List<TechnicianOrderModel> newTechnicianRequests;
  final List<TechnicianOrderModel> upcomingTechnicianRequests;
  final List<TechnicianOrderModel> historyTechnicianRequests;

  TechnicianOrdersSuccessSplit({
    required this.newTechnicianRequests,
    required this.upcomingTechnicianRequests,
    required this.historyTechnicianRequests,
  });

  @override
  List<Object?> get props => [
    newTechnicianRequests,
    upcomingTechnicianRequests,
    historyTechnicianRequests,
  ];
}

class TechnicianOrdersError extends TechnicianOrdersState {
  final String error;

  TechnicianOrdersError(this.error);

  @override
  List<Object?> get props => [error];
}
