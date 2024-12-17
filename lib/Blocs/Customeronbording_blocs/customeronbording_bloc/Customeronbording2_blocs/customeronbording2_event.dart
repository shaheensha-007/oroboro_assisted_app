part of 'customeronbording2_bloc.dart';

@immutable
abstract class Customeronbording2Event {}
class FetchCustomeronbording2 extends Customeronbording2Event{
  final String userid;
  final String Customercode;
  final String partnercode;
  final String agentcode;
  final BuildContext ctx;
  FetchCustomeronbording2({
   required this.userid,
   required this.Customercode,
   required this.partnercode,
   required this.agentcode,
   required this.ctx
});
}
