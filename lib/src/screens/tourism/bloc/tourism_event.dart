import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TourismEvent extends Equatable {
  TourismEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadTourismEvent extends TourismEvent{
  @override
  String toString() => 'LoadTourismEvent';
}
