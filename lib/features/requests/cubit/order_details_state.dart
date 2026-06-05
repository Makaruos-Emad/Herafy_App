import 'package:equatable/equatable.dart';
import 'package:herafy/features/requests/model/order_details_model.dart';

abstract class OrderDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsModel orderDetalis;

  OrderDetailsSuccess(this.orderDetalis);

  @override
  List<Object?> get props => [orderDetalis];
}

class OrderDetailsError extends OrderDetailsState {
  final String error;

  OrderDetailsError(this.error);

  @override
  List<Object?> get props => [error];
}
