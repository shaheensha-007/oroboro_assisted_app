part of 'customeronbording_bloc.dart';

@immutable
abstract class CustomeronbordingEvent {}
class FetchCustomeronbording extends CustomeronbordingEvent{
  final String userid;
  final String Customercode;
  FetchCustomeronbording({required this.userid,required this.Customercode});
}