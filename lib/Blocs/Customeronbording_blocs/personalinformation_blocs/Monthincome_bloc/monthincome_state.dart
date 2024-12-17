part of 'monthincome_bloc.dart';

@immutable
abstract class MonthincomeState {}

class MonthincomeInitial extends MonthincomeState {}
class MonthincomeblocLoading extends MonthincomeState{}
class MonthincomeblocLoaded extends MonthincomeState{
  final MonthincomeModel monthincomeModel;
  MonthincomeblocLoaded({required this.monthincomeModel});
}
class MonthioncomeblocError extends MonthincomeState{
  final String Errormessage;
  MonthioncomeblocError({required this.Errormessage});
}
