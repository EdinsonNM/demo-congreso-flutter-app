import 'package:congreso_incca/src/models/notification.dart';
import 'package:meta/meta.dart';

@immutable
class NotificationsState {
  final bool inProgress;
  final List<Notification> notifications;
  final bool isSuccess;
  final bool isFailure;
  NotificationsState({
    @required this.inProgress,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.notifications,
  });

  factory NotificationsState.empty() {
    return NotificationsState(
      inProgress: false,
      notifications: [],
      isSuccess: false,
      isFailure: false
    );
  }
  
  NotificationsState copyWith({
    bool inProgress,
    List<Notification> notifications,
    bool isSuccess,
    bool isFailure,
  }) {
    return NotificationsState(
      inProgress: inProgress ?? this.inProgress,
      notifications: notifications ?? this.notifications,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
  @override
  String toString() {
    return '''NotificationsState {
      inProgress: $inProgress,
      notifications: $notifications,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}