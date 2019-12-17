import 'package:congreso_incca/src/models/comite.dart';
import 'package:congreso_incca/src/models/program.dart';
import 'package:meta/meta.dart';

@immutable
class WelcomeState {
  final bool inProgress;
  final List<Comite> comites;
  final bool isSuccess;
  final bool isFailure;
  WelcomeState({
    @required this.inProgress,
    @required this.comites,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory WelcomeState.empty() {
    return WelcomeState(
      inProgress: false,
      comites: [],
      isSuccess: false,
      isFailure: false
    );
  }

  
  factory WelcomeState.failure() {
    return WelcomeState(
      inProgress: false,
      comites: [],
      isSuccess: false,
      isFailure: true,
    );
  }

  success(List<Comite> comites) {
    return copyWith(
      comites: comites,
      inProgress: false
    );
  }
  
  WelcomeState copyWith({
    bool inProgress,
    List<Comite> comites,
    bool selectedTab,
    bool isSuccess,
    bool isFailure,
    Program program,
  }) {
    return WelcomeState(
      inProgress: inProgress ?? this.inProgress,
      comites: comites ?? this.comites,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
  @override
  String toString() {
    return '''WelcomeState {
      inProgress: $inProgress,
      comites: $comites,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}