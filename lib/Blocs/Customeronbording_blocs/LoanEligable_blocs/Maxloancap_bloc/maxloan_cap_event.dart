part of 'maxloan_cap_bloc.dart';

@immutable
abstract class MaxloanCapEvent {}
class FetchMaxloancap extends MaxloanCapEvent{
  final String userid;
  final String Customercode;
  final BuildContext ctx;
  FetchMaxloancap({
    required this.userid,
    required this.Customercode,
    required this.ctx
});
}
