part of 'customeronbording_bloc.dart';

@immutable
abstract class CustomeronbordingEvent {}
class FetchCustomeronbording extends CustomeronbordingEvent{
  final String userid;
  final String Customercode;
  final String partnercode;
  final String agentcode;
  final BuildContext ctx;
  FetchCustomeronbording({required this.userid,required this.Customercode, required this.partnercode,required this.agentcode,required this.ctx});
}