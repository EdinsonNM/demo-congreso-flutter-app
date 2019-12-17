import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakersEvent extends Equatable {
  SpeakersEvent([List props = const <dynamic>[]]) : super(props);
}


class LoadCountriesEvent extends SpeakersEvent{
  @override
  String toString() => 'LoadCountriesEvent';
}

class LoadSpeakersEvent extends SpeakersEvent{
  @override
  String toString() => 'LoadSpeakersEvent';
}

class LoadSpeakersByCountryEvent extends SpeakersEvent{
  final int country;
  LoadSpeakersByCountryEvent({this.country});
  @override
  String toString() => 'LoadSpeakersByCountryEvent';
}
