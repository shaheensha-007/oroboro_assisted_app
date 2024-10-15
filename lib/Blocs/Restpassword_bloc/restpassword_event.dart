part of 'restpassword_bloc.dart';

@immutable
abstract class RestpasswordEvent {}
class FetchRestpassword extends RestpasswordEvent{
  final String userId;
  final String password;
  final BuildContext ctx;
  FetchRestpassword({
   required this.userId,
   required this.password,
   required this.ctx

});
}
