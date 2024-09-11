part of 'merchart_token_bloc.dart';

@immutable
abstract class MerchartTokenState {}

class MerchartTokenInitial extends MerchartTokenState {}
class MerchartTokenblocLoading extends MerchartTokenState{}
class MerchartTokenblocLoaded extends MerchartTokenState{}
class MerchartTokenblocError extends MerchartTokenState{}
