part of 'customeronbording_bloc.dart';

@immutable
abstract class CustomeronbordingState {}

class CustomeronbordingInitial extends CustomeronbordingState {}
class CustomeronbordingblocLoading extends CustomeronbordingState{}
class CustomeronbordingblocLoaded extends CustomeronbordingState{
  final CustomeronbordingstatusModel customeronbordingstatusModel;
  CustomeronbordingblocLoaded({required this.customeronbordingstatusModel});
}
class CustomeronbordingblocError extends CustomeronbordingState{
  final String Errormessage;
  CustomeronbordingblocError({required this.Errormessage});
}