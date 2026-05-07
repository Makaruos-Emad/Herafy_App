part of 'technical_details_cubit.dart';

sealed class TechnicalDetailsState extends Equatable {
  const TechnicalDetailsState();

  @override
  List<Object?> get props => [];
}

class TechnicalDetailsInitial extends TechnicalDetailsState {}

class TechnicalDetailsLoading extends TechnicalDetailsState {}

class TechnicalDetailsSuccess extends TechnicalDetailsState {
  final Map<String, dynamic> details;
  final List reviews;
  final List previousWork;

  const TechnicalDetailsSuccess({
    required this.details,
    required this.reviews,
    required this.previousWork

  });

  @override
  List<Object?> get props => [details, reviews, previousWork];
}

class TechnicalDetailsError extends TechnicalDetailsState {
  final String message;

  const TechnicalDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}