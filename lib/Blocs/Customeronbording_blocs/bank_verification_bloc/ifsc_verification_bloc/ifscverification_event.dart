part of 'ifscverification_bloc.dart';

@immutable
abstract class IfscverificationEvent {}
class FetchIfscverification extends IfscverificationEvent{
  final String userId;
  final String ifsccode;
  FetchIfscverification({
   required this.userId,
   required this .ifsccode,
});
}
