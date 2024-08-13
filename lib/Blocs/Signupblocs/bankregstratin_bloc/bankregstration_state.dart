part of 'bankregstration_bloc.dart';

@immutable
abstract class BankregstrationState {}

class BankregstrationInitial extends BankregstrationState {}
class BankregstrationblocLoading extends BankregstrationState{}
class BankregstrationblocLoaded extends BankregstrationState{}
class BankregstrationblocError extends BankregstrationState{}
