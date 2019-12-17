import 'package:congreso_incca/src/models/tourism.dart';
import 'package:meta/meta.dart';

@immutable
class TourismState {
  final bool inProgress;
  final List<Tourism> tourismList;
  final bool isSuccess;
  final bool isFailure;
  TourismState({
    @required this.inProgress,
    @required this.tourismList,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory TourismState.empty() {
    return TourismState(
      inProgress: false,
      tourismList: [],
      isSuccess: false,
      isFailure: false
    );
  }
  
  TourismState copyWith({
    bool inProgress,
    List<Tourism> tourismList,
    bool selectedTab,
    bool isSuccess,
    bool isFailure,
  }) {
    return TourismState(
      inProgress: inProgress ?? this.inProgress,
      tourismList: tourismList ?? this.tourismList,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
  @override
  String toString() {
    return '''TourismState {
      inProgress: $inProgress,
      tourismList: $tourismList,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}