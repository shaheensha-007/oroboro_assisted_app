part of 'aadhaarsendotp_bloc.dart';

@immutable
abstract class AadhaarsendotpState {}

class AadhaarsendotpInitial extends AadhaarsendotpState {}
class AadhaarSendotpblocLoading extends AadhaarsendotpState{}
class AadhaarSendOtpblocLoaded extends AadhaarsendotpState{
  final AadhaarsendotpModel aadhaarsendotpModel;
  AadhaarSendOtpblocLoaded({required this.aadhaarsendotpModel});
}
class AadhaarSendOtpblocError extends AadhaarsendotpState{
  final String Errormessage;
  AadhaarSendOtpblocError({required this.Errormessage});
}
