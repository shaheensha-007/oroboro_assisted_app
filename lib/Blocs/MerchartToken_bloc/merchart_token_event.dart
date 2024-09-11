part of 'merchart_token_bloc.dart';

@immutable
abstract class MerchartTokenEvent {}
class FetchMerchartToken extends MerchartTokenEvent{
  final String userName;
  final String password;
  FetchMerchartToken({required this.userName,required this.password});
}
