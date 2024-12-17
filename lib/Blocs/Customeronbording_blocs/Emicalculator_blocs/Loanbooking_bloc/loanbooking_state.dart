part of 'loanbooking_bloc.dart';

@immutable
abstract class LoanbookingState {}

class LoanbookingInitial extends LoanbookingState {}
class LoanbookingblocLoading extends LoanbookingState{}
class LoanbookingblocLoaded extends LoanbookingState{
  final LoanbookingModel loanbookingModel;
  LoanbookingblocLoaded({required this.loanbookingModel});
}
class LoanbookingblocError extends LoanbookingState{
  final String Errormessage;
  LoanbookingblocError({required this.Errormessage});
}
