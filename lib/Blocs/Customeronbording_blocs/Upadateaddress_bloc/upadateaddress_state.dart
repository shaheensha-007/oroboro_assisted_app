part of 'upadateaddress_bloc.dart';

@immutable
abstract class UpadateaddressState {}

class UpadateaddressInitial extends UpadateaddressState {}
class UpadateaddressblocLoading extends UpadateaddressState{}
class UpadateaddressblocLoaded extends UpadateaddressState{
  final UpadateaddressModel upadateaddressModel;
  UpadateaddressblocLoaded({required this.upadateaddressModel});
}
class UpadateaddressblocError extends UpadateaddressState{
  final String Errormessage;
  UpadateaddressblocError({required this.Errormessage});
}
