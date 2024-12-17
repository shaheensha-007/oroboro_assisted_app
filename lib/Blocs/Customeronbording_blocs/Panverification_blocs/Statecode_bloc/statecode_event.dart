part of 'statecode_bloc.dart';

@immutable
abstract class StatecodeEvent {}
class Fetchstatecode extends StatecodeEvent{
  final BuildContext ctx;
  Fetchstatecode({
    required this.ctx,
});
}
