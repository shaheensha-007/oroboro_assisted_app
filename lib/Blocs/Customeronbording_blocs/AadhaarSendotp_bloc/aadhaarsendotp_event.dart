part of 'aadhaarsendotp_bloc.dart';

@immutable
abstract class AadhaarsendotpEvent {}
class FetchAadhaarsendotp extends AadhaarsendotpEvent{
  final String userId;
  final String Customercode;
  final String Aadhaar;
  FetchAadhaarsendotp({
   required this.userId,
   required this .Customercode,
   required this.Aadhaar
});
}
