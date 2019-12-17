import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/program.dart';
import 'package:congreso_incca/src/models/speaker.dart';
import 'package:congreso_incca/src/providers/program.provider.dart';
import 'package:congreso_incca/src/providers/speaker.provider.dart';
import './programs_event.dart';
import './programs_state.dart';

class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  @override
  ProgramsState get initialState => ProgramsState.empty();

  @override
  Stream<ProgramsState> mapEventToState(
    ProgramsEvent event,
  ) async* {
    if(event is LoadProgramsEvent){
      yield currentState.copyWith(inProgress: true);
      List<Program> data = await ProgramProvider.getAll();
      yield currentState.copyWith(programs: data, inProgress: false);
      List<Program> programsByDay =currentState.programs.where((program) => program.day == "0").toList();
      programsByDay.sort((Program a, Program b) {
        return a.time.compareTo(b.time);
      });
      yield currentState.copyWith(programsByDay: programsByDay);
    }
    if(event is LoadProgramsByDayEvent){
      yield currentState.copyWith(inProgress: true, selectedTab: event.id);
      List<Program> programsByDay = currentState.programs.where((program) => program.day == event.id.toString()).toList();
      programsByDay.sort((Program a, Program b) {
        return a.time.compareTo(b.time);
      });
      yield currentState.copyWith(programsByDay: programsByDay, inProgress: false);
    }
    if(event is LoadSpeakerEvent){
      yield currentState.copyWith(inProgress: true);
      Speaker speaker = await SpeakerProvider.get(event.id);
      yield currentState.copyWith(speaker: speaker, inProgress: false);
    }
  }
}