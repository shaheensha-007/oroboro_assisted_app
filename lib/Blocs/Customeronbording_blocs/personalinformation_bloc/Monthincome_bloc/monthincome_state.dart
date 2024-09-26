part of 'monthincome_bloc.dart';

@immutable
abstract class MonthincomeState {}

class MonthincomeInitial extends MonthincomeState {}
class MonthincomeblocLoading extends MonthincomeState{}
class MonthincomeblocLoaded extends MonthincomeState{}
class MonthioncomeblocError extends MonthincomeState{}
