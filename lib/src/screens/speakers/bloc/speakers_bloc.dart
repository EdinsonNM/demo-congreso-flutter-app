import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/country.dart';
import 'package:congreso_incca/src/models/speaker.dart';
import 'package:congreso_incca/src/providers/country.provider.dart';
import 'package:congreso_incca/src/providers/speaker.provider.dart';
import './bloc.dart';

class SpeakersBloc extends Bloc<SpeakersEvent, SpeakersState> {
  @override
  SpeakersState get initialState => SpeakersState.empty();

  @override
  Stream<SpeakersState> mapEventToState(
    SpeakersEvent event,
  ) async* {
    if (event is LoadCountriesEvent) {
      yield currentState.copyWith(inProgress: true);
      List<Country> countries = await CountryProvider.getAll();
      yield currentState.copyWith(countries: countries, inProgress: false);
    }
    if (event is LoadSpeakersEvent) {
      yield currentState.copyWith(inProgress: true);
      List<Speaker> speakers = await SpeakerProvider.getAll();
      yield currentState.copyWith(speakers: speakers, inProgress: false);
    }
    if (event is LoadSpeakersByCountryEvent) {
      List<Speaker> speakersByCountry = currentState.speakers
          .where((Speaker speaker) => speaker.country == event.country.toString()).toList();
      yield currentState.copyWith(speakersByCountry: speakersByCountry);
    }
  }
}
