part of 'bankupdate_bloc.dart';

@immutable
abstract class BankupdateState {}

class BankupdateInitial extends BankupdateState {}
class BankupdateblocLoading extends BankupdateState{}
class BankupdateblocLoaded extends BankupdateState{}
class BankupdateblocError extends BankupdateState{}
