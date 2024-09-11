part of 'customerupdate_bloc.dart';

@immutable
abstract class CustomerupdateEvent {}
class FetchCustomerupdate extends CustomerupdateEvent{
  final String userid;
  final String Customercode;
  final String PartnerCode;
  final String FlowId;
  final String PageOrder;
  FetchCustomerupdate({
   required this.userid,
   required this.Customercode,
   required this.PartnerCode,
   required this.FlowId,
   required this.PageOrder
});
}
