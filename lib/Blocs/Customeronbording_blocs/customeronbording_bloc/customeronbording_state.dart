part of 'customeronbording_bloc.dart';

@immutable
abstract class CustomeronbordingState {}

class CustomeronbordingInitial extends CustomeronbordingState {}
class CustomeronbordingblocLoading extends CustomeronbordingState{}
class CustomeronbordingblocLoaded extends CustomeronbordingState{}
class CustomeronbordingblocError extends CustomeronbordingState{}