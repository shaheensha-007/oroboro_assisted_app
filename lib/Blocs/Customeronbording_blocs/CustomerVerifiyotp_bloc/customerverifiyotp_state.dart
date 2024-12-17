part of 'customerverifiyotp_bloc.dart';

@immutable
abstract class CustomerverifiyotpState {}

class CustomerverifiyotpInitial extends CustomerverifiyotpState {}
class CustomerverifiyotpblocLoading extends CustomerverifiyotpState{}
class CustomerverifiyotpblocLoaded extends CustomerverifiyotpState{
  final CustomerVerifiyotpModel customerVerifiyotpModel;
  CustomerverifiyotpblocLoaded({required this.customerVerifiyotpModel});
}
class CustomerverifiyotpblocError extends CustomerverifiyotpState{
  final String Errormessage;
  CustomerverifiyotpblocError({required this.Errormessage});
}
