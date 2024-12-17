part of 'maxloan_cap_bloc.dart';

@immutable
abstract class MaxloanCapState {}

class MaxloanCapInitial extends MaxloanCapState {}
class MaxloanCapblocLoading extends MaxloanCapState{}
class MaxloanCapblocLoaded extends MaxloanCapState{
   final MaxloancapModel ismaxloancapmodel;
   MaxloanCapblocLoaded({required this.ismaxloancapmodel});
}
class MaxloanCapblocError extends MaxloanCapState{
   final String Errormessage;
   MaxloanCapblocError({required this.Errormessage});
}
