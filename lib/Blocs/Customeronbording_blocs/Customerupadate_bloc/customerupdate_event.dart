part of 'customerupdate_bloc.dart';

@immutable
abstract class CustomerupdatenextEvent {}

class FetchCustomerupdate extends CustomerupdatenextEvent {
  final String userid;
  final String Customercode;
  final String PartnerCode;
  final String FlowId;
  final String PageOrder;
  final String ApplicationId;
  final String PageType;
  final BuildContext ctx;
  FetchCustomerupdate({
      required this.userid,
      required this.Customercode,
      required this.PartnerCode,
      required this.FlowId,
      required this.PageOrder,
      required this.ApplicationId,
      required this.PageType,
      required this.ctx});
}
