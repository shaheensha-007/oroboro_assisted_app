part of 'cibilscore_bloc.dart';

@immutable
abstract class CibilscoreEvent {}
class FetchCilbilscore extends CibilscoreEvent{
  final String userid;
  final String Customercode;
  final String ApplicationId;
  final String PAN;
  final String Name;
  final String Address;
  final String City;
  final String State;
  final String Pincode;
  final String Dob;
  final BuildContext ctx;
  FetchCilbilscore({
    required this.userid,
    required this.Customercode,
    required this.ApplicationId,
    required this.PAN,
    required this.Name,
    required this.Address,
    required this.City,
    required this.State,
    required this.Pincode,
    required this.Dob,
    required this.ctx,
});

}
