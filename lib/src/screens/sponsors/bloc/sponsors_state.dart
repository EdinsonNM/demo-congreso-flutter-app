import 'package:congreso_incca/src/models/program.dart';
import 'package:congreso_incca/src/models/sponsor.dart';
import 'package:meta/meta.dart';

@immutable
class SponsorsState {
  final bool inProgress;
  final List<Sponsor> sponsors;
  final bool isSuccess;
  final bool isFailure;
  SponsorsState({
    @required this.inProgress,
    @required this.sponsors,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory SponsorsState.empty() {
    return SponsorsState(
      inProgress: false,
      sponsors: [],
      isSuccess: false,
      isFailure: false
    );
  }

  
  factory SponsorsState.failure() {
    return SponsorsState(
      inProgress: false,
      sponsors: [],
      isSuccess: false,
      isFailure: true,
    );
  }

  success(List<Sponsor> sponsors) {
    return copyWith(
      sponsors: sponsors,
      inProgress: false
    );
  }
  
  SponsorsState copyWith({
    bool inProgress,
    List<Sponsor> sponsors,
    bool selectedTab,
    bool isSuccess,
    bool isFailure,
    Program program,
  }) {
    return SponsorsState(
      inProgress: inProgress ?? this.inProgress,
      sponsors: sponsors ?? this.sponsors,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
  @override
  String toString() {
    return '''SponsorsState {
      inProgress: $inProgress,
      sponsors: $sponsors,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}