part of 'panverification_bloc.dart';

@immutable
abstract class PanverificationEvent {}
class FetchPanverification extends PanverificationEvent{
  final String userid;
  final String Customercode;
  final String PAN;
  FetchPanverification({
    required this.userid,
    required this.Customercode,
    required this.PAN,
});
}
