part of 'previewdocument_bloc.dart';

@immutable
abstract class PreviewdocumentState {}

class PreviewdocumentInitial extends PreviewdocumentState {}
class Previewdocumentblocloading extends PreviewdocumentState{}
class PreviewdocumentblocLoaded extends PreviewdocumentState{}
class PreviewdocumentblocError extends PreviewdocumentState{}