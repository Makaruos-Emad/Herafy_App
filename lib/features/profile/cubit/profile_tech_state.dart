import 'package:equatable/equatable.dart';

abstract class ProfileTechState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileTechInitial extends ProfileTechState {}

class ProfileTechLoading extends ProfileTechState {}

class ProfileTechSuccess extends ProfileTechState {
  final Map<String, dynamic> profile;

  ProfileTechSuccess(this.profile);

  @override
  List<Object?> get props => [profile];
}

class ProfileTechError extends ProfileTechState {
  final String error;

  ProfileTechError(this.error);

  @override
  List<Object?> get props => [error];
}
class ProfileImagePicked extends ProfileTechState {}