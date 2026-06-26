import 'package:equatable/equatable.dart';
import 'package:herafy/features/technical_task/model/order_details_technician_model.dart';

abstract class OrderDetailsTechnicianState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderDetailsTechnicianInitial extends OrderDetailsTechnicianState {}

class OrderDetailsTechnicianLoading extends OrderDetailsTechnicianState {}

class OrderDetailsTechnicianSuccess extends OrderDetailsTechnicianState {
  final OrderDetailsTechnicianModel orderDetails;

  OrderDetailsTechnicianSuccess(this.orderDetails);

  @override
  List<Object?> get props => [orderDetails];
}

class OrderDetailsTechnicianError extends OrderDetailsTechnicianState {
  final String error;

  OrderDetailsTechnicianError(this.error);

  @override
  List<Object?> get props => [error];
}
