part of 'ifscverification_bloc.dart';

@immutable
abstract class IfscverificationState {}

class IfscverificationInitial extends IfscverificationState {}
class IfscVerificationblocLoading extends IfscverificationState{}
class IfscVerificationblocLoaded extends IfscverificationState{
  final IfscverificationModel ifscverificationModel;
  IfscVerificationblocLoaded({required this.ifscverificationModel});
}
class IfscVerificatonblocError extends IfscverificationState{
  final String Errormessage;
  IfscVerificatonblocError({required this.Errormessage});
}

