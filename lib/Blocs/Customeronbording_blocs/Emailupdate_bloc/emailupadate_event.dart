part of 'emailupadate_bloc.dart';

@immutable
abstract class EmailupadateEvent {}
class FetchEmailupadate extends EmailupadateEvent{
  final String userid;
  final String Customercode;
  final String Emailid;
  FetchEmailupadate({
    required this.userid,
    required this.Customercode,
    required this.Emailid
  });
}
