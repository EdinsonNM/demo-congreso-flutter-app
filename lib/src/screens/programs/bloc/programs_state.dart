import 'package:congreso_incca/src/models/program.dart';
import 'package:congreso_incca/src/models/speaker.dart';
import 'package:meta/meta.dart';

@immutable
class ProgramsState {
  final bool inProgress;
  final List<Program> programs;
  final List<Program> programsByDay;
  final bool isSuccess;
  final bool isFailure;
  final int selectedTab;
  final Program program;
  final Speaker speaker;
  ProgramsState({
    @required this.inProgress,
    @required this.speaker,
    @required this.programs,
    @required this.programsByDay,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.selectedTab,
    @required this.program
  });

  factory ProgramsState.empty() {
    return ProgramsState(
      selectedTab: 0,
      inProgress: false,
      programs: [],
      programsByDay: [],
      program: null,
      isSuccess: false,
      isFailure: false,
      speaker: null
    );
  }

  factory ProgramsState.loading(int tab) {
    return ProgramsState(
      selectedTab: tab,
      inProgress: true,
      programs: [],
      programsByDay: [],
      program: null,
      isSuccess: false,
      isFailure: false,
      speaker: null
    );
  }

  factory ProgramsState.failure() {
    return ProgramsState(
      selectedTab: 0,
      inProgress: false,
      programs: [],
      programsByDay: [],
      isSuccess: false,
      isFailure: true,
      program: null,
      speaker: null
    );
  }

  ProgramsState copyWith({
    bool inProgress,
    List<Program> programs,
    List<Program> programsByDay,
    int selectedTab,
    bool isSuccess,
    bool isFailure,
    Program program,
    Speaker speaker
  }) {
    return ProgramsState(
      speaker: speaker ?? this.speaker,
      inProgress: inProgress ?? this.inProgress,
      programs: programs ?? this.programs,
      programsByDay: programsByDay ?? this.programsByDay,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      selectedTab: selectedTab?? this.selectedTab,
      program: program?? this.program
    );
  }
  @override
  String toString() {
    return '''ProgramsState {
      inProgress: $inProgress,
      programs: $programs,
      programsByDay: $programsByDay,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}