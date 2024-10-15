part of 'merchart_token_bloc.dart';

@immutable
abstract class MerchartTokenEvent {}
class FetchMerchartToken extends MerchartTokenEvent{
  final String userName;
  final String password;
  final BuildContext ctx;
  FetchMerchartToken({required this.userName,required this.password,required this.ctx});
}
