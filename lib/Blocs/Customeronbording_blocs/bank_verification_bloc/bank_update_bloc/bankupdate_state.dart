part of 'bankupdate_bloc.dart';

@immutable
abstract class BankupdateState {}

class BankupdateInitial extends BankupdateState {}
class BankupdateblocLoading extends BankupdateState{}
class BankupdateblocLoaded extends BankupdateState{
  final BankupdateModel bankupdateModel;
  BankupdateblocLoaded({required this.bankupdateModel});
}
class BankupdateblocError extends BankupdateState{
  final String Errormessage;
  BankupdateblocError({required this.Errormessage});
}
