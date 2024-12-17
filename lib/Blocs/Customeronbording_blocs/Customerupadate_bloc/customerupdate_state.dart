part of 'customerupdate_bloc.dart';

@immutable
abstract class CustomerupdatenextState {}

class CustomerupdateInitial extends CustomerupdatenextState {}
class CustomerupdatenextblocLoading extends CustomerupdatenextState{}
class CustomerupdatenextblocLoaded extends CustomerupdatenextState{
  final UpadatenextprocessModel upadatenextprocessModel;
  CustomerupdatenextblocLoaded({required this.upadatenextprocessModel});
}
class CustomerupdatenextblocError extends CustomerupdatenextState{
  final String Errormessage;
  CustomerupdatenextblocError({required this.Errormessage});
}
