part of 'agentkyc_bloc.dart';

@immutable
abstract class AgentkycState {}

class AgentkycInitial extends AgentkycState {}
class AgentKycblocLoading extends AgentkycState{}
class AgentKycblocLoaded extends AgentkycState{}
class AgentKycblocError extends AgentkycState{}
