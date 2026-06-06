import 'package:equatable/equatable.dart';

abstract class CreateComplaintState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateComplaintInitial extends CreateComplaintState {}

class CreateComplaintLoading extends CreateComplaintState {}

class CreateComplaintSuccess extends CreateComplaintState {}

class CreateComplaintError extends CreateComplaintState {
  final String error;
  CreateComplaintError(this.error);
  @override
  List<Object?> get props => [error];
}
