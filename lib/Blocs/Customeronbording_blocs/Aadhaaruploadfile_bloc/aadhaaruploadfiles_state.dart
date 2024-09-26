part of 'aadhaaruploadfiles_bloc.dart';

@immutable
abstract class AadhaaruploadfilesState {}

class AadhaaruploadfilesInitial extends AadhaaruploadfilesState {}
class AadhaaruploadfilesblocLoading extends AadhaaruploadfilesState{}
class AadhaaruploadfilesblocLoaded extends AadhaaruploadfilesState{}
class AadhaaruploadfilesblocError extends AadhaaruploadfilesState{}
