import 'package:equatable/equatable.dart';
import 'package:herafy/features/requests/model/requests_model.dart';

abstract class OrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccessSplit extends OrdersState {
  final List<RequestsModel> active;
  final List<RequestsModel> finished;

  OrdersSuccessSplit({required this.active, required this.finished});

  @override
  List<Object?> get props => [active, finished];
}

class OrdersError extends OrdersState {
  final String error;

  OrdersError(this.error);

  @override
  List<Object?> get props => [error];
}
