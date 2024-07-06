part of 'token_bloc.dart';

@immutable
abstract class TokenEvent {}
class FetchToken extends TokenEvent{
final String userName;
final String passwordInBase64;
final BuildContext ctx;
FetchToken({required this.userName,required this.passwordInBase64,required this.ctx});
}