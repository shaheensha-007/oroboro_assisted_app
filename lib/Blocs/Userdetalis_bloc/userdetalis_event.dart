part of 'userdetalis_bloc.dart';

@immutable
abstract class UserdetalisEvent {}
class FetchUserdetalis extends UserdetalisEvent{
  final String userId;
  final String Identity;
  FetchUserdetalis({
    required this.userId,
    required this.Identity,
});
}
