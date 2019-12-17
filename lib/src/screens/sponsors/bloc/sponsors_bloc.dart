import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/sponsor.dart';
import 'package:congreso_incca/src/providers/sponsor.provider.dart';
import './bloc.dart';

class SponsorsBloc extends Bloc<SponsorsEvent, SponsorsState> {
  @override
  SponsorsState get initialState => SponsorsState.empty();

  @override
  Stream<SponsorsState> mapEventToState(
    SponsorsEvent event,
  ) async* {
    if(event is LoadSponsorsEvent){
      yield currentState.copyWith(inProgress: true);
      List<Sponsor> sponsors = await SponsorProvider.getAll(); 
      yield currentState.success(sponsors);
    }
  }
}
