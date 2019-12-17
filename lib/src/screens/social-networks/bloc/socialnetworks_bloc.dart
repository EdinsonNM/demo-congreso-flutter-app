import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SocialnetworksBloc extends Bloc<SocialnetworksEvent, SocialnetworksState> {
  @override
  SocialnetworksState get initialState => InitialSocialnetworksState();

  @override
  Stream<SocialnetworksState> mapEventToState(
    SocialnetworksEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
