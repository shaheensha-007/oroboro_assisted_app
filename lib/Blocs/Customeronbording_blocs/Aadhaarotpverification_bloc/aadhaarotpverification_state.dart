part of 'aadhaarotpverification_bloc.dart';

@immutable
abstract class AadhaarotpverificationState {}

class AadhaarotpverificationInitial extends AadhaarotpverificationState {}
class AadhaarotpverificationblocLoading extends  AadhaarotpverificationState{}
class AadhaarotpvetrificationblocLoaded extends AadhaarotpverificationState{
  final AadhaarOtpVerificationModel aadhaarOtpVerificationModel;
  AadhaarotpvetrificationblocLoaded({required this.aadhaarOtpVerificationModel});
}
class AadhaarotpverificationblocError extends AadhaarotpverificationState{
  final String Errormessage;
  AadhaarotpverificationblocError({required this.Errormessage});
}
