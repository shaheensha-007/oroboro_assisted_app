part of 'customeronbording2_bloc.dart';

@immutable
abstract class Customeronbording2State {}

class Customeronbording2Initial extends Customeronbording2State {}
class Customeronbording2blocLoading extends Customeronbording2State{}
class Customeronbording2blocLoaded extends Customeronbording2State{
  final Customeronbording2Model customeronbording2model;
  Customeronbording2blocLoaded({required this.customeronbording2model});
}
class Customeronbording2blocError extends Customeronbording2State{
  final String Errormessage;
  Customeronbording2blocError({required this.Errormessage});
}
