part of 'co_borrower_bloc.dart';

@immutable
abstract class CoBorrowerState {}

class CoBorrowerInitial extends CoBorrowerState {}
class CoBorrowerblocLoding extends CoBorrowerState{}
class CoBorrowerblocLoaded extends CoBorrowerState{
  final CoBorrowerModel coBorrowerModel;
  CoBorrowerblocLoaded({required this.coBorrowerModel});
}
class CoBorrowerblocError extends CoBorrowerState{
  final String Errormessage;
  CoBorrowerblocError({required this.Errormessage});
}
