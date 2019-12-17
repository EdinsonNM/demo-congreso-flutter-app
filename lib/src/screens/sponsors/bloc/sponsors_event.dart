import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SponsorsEvent extends Equatable {
  SponsorsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadSponsorsEvent extends SponsorsEvent{
  @override
  String toString() => 'LoadProgramsEvent';
}
