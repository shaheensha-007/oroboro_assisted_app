part of 'agentbusiness_bloc.dart';

@immutable
abstract class AgentbusinessState {}

class AgentbusinessInitial extends AgentbusinessState {}
class AgentbusinessblocLoading extends AgentbusinessState{}
class AgentbusinessblocLoaded extends AgentbusinessState{}
class AgentbusinessblocError extends AgentbusinessState{}
