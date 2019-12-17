import 'package:congreso_incca/src/models/country.dart';
import 'package:congreso_incca/src/models/program.dart';
import 'package:congreso_incca/src/models/speaker.dart';
import 'package:meta/meta.dart';

@immutable
class SpeakersState {
  final bool inProgress;
  final List<Country> countries;
  final List<Speaker> speakers;
  final List<Speaker> speakersByCountry;
  final bool isSuccess;
  final bool isFailure;
  SpeakersState({
    @required this.speakersByCountry,
    @required this.inProgress,
    @required this.countries,
    @required this.speakers,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory SpeakersState.empty() {
    return SpeakersState(
      speakersByCountry: [],
      inProgress: false,
      countries: [],
      speakers: [],
      isSuccess: false,
      isFailure: false
    );
  }
  
  SpeakersState copyWith({
    bool inProgress,
    List<Country> countries,
    bool selectedTab,
    bool isSuccess,
    bool isFailure,
    Program program,
    List<Speaker> speakers,
    List<Speaker> speakersByCountry
  }) {
    return SpeakersState(
      speakersByCountry: speakersByCountry ?? this.speakersByCountry,
      inProgress: inProgress ?? this.inProgress,
      countries: countries ?? this.countries,
      speakers: speakers ?? this.speakers,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
  @override
  String toString() {
    return '''SpeakersState {
      speakersByCountry: $speakersByCountry,
      inProgress: $inProgress,
      countries: $countries,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}