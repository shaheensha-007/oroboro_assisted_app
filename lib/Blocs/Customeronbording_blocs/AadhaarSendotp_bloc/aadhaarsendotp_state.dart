part of 'aadhaarsendotp_bloc.dart';

@immutable
abstract class AadhaarsendotpState {}

class AadhaarsendotpInitial extends AadhaarsendotpState {}
class AadhaarSendotpblocLoading extends AadhaarsendotpState{}
class AadhaarSendOtpblocLoaded extends AadhaarsendotpState{}
class AadhaarSendOtpblocError extends AadhaarsendotpState{}
