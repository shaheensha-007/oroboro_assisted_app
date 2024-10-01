part of 'ifscverification_bloc.dart';

@immutable
abstract class IfscverificationState {}

class IfscverificationInitial extends IfscverificationState {}
class IfscVerificationblocLoading extends IfscverificationState{}
class IfscVerificationblocLoaded extends IfscverificationState{}
class IfscVerificatonblocError extends IfscverificationState{}

