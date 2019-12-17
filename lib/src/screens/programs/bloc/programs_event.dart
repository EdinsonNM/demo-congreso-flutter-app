import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProgramsEvent extends Equatable {
  ProgramsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadProgramsEvent extends ProgramsEvent{
  LoadProgramsEvent() ;
  @override
  String toString() => 'LoadProgramsEvent';
}
class LoadProgramsByDayEvent extends ProgramsEvent{
  final int id;
  LoadProgramsByDayEvent({this.id}) ;
  @override
  String toString() => 'LoadProgramsByDayEvent';
}

class LoadSpeakerEvent extends ProgramsEvent{
  final String id;
  LoadSpeakerEvent({this.id}) : super([id]);
  @override
  String toString() => 'LoadSpeakerEvent';
}
