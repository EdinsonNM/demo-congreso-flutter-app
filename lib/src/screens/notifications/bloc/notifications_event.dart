import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NotificationsEvent extends Equatable {
  NotificationsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadNotificationsEvent extends NotificationsEvent{
  @override
  String toString() => 'LoadNotificationsEvent';
} 