import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WelcomeEvent extends Equatable {
  WelcomeEvent([List props = const <dynamic>[]]) : super(props);
}


class LoadComitesEvent extends WelcomeEvent{
  @override
  String toString() => 'LoadComitesEvent';
}
