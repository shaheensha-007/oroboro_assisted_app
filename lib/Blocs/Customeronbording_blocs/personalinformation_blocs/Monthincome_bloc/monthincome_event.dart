part of 'monthincome_bloc.dart';

@immutable
abstract class MonthincomeEvent {}
class FetchMonthincome extends MonthincomeEvent{
  final String userId;
  final String Customercode;
  final String EmploymentStatus;
  final String Income;
  final String MonthlyEMIAmount;
  final BuildContext ctx;

  FetchMonthincome({
   required this.userId,
   required this.Customercode,
   required this.EmploymentStatus,
   required this.Income,
   required this.MonthlyEMIAmount,
   required this.ctx
});

}
