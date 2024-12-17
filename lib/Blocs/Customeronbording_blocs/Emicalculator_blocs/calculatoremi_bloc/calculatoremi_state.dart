part of 'calculatoremi_bloc.dart';

@immutable
abstract class CalculatoremiState {}

class CalculatoremiInitial extends CalculatoremiState {}
class CalculatoremiblocLoading extends CalculatoremiState{}
class CalculatoremiblocLoaded extends CalculatoremiState{
  final CalculatoremiModel calculatoremiModel;
  CalculatoremiblocLoaded({required this.calculatoremiModel});
}
class CalculatoremiblocError extends CalculatoremiState{
  final String Errormessage;
  CalculatoremiblocError({required this.Errormessage});
}
