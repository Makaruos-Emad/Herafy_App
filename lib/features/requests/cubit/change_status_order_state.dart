import 'package:equatable/equatable.dart';

abstract class ChangeStatusOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeStatusOrderInitial extends ChangeStatusOrderState {}

class ChangeStatusOrderLoading extends ChangeStatusOrderState {}

class ChangeStatusOrderSuccess extends ChangeStatusOrderState {}

class ChangeStatusOrderError extends ChangeStatusOrderState {
  final String error;

  ChangeStatusOrderError(this.error);

  @override
  List<Object?> get props => [error];
}
