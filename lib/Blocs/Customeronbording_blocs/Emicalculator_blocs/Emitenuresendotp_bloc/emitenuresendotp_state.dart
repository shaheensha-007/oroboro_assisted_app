part of 'emitenuresendotp_bloc.dart';

@immutable
abstract class EmitenuresendotpState {}

class EmitenuresendotpInitial extends EmitenuresendotpState {}
class EmitenuresendotpblocLoading extends EmitenuresendotpState{}
class EmitenuresendotpblocLoaded extends EmitenuresendotpState{
  final EmitenuresendotpModel emitenuresendotpModel;
  EmitenuresendotpblocLoaded({required this.emitenuresendotpModel});
}
class EmitenuresendotpblocError extends EmitenuresendotpState{
  final String Errormessage;
  EmitenuresendotpblocError({required this.Errormessage});
}
