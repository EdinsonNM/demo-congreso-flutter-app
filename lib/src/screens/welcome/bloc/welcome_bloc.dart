import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/comite.dart';
import 'package:congreso_incca/src/providers/comite.provider.dart';
import './bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  @override
  WelcomeState get initialState => WelcomeState.empty();

  @override
  Stream<WelcomeState> mapEventToState(
    WelcomeEvent event,
  ) async* {
    if(event is LoadComitesEvent){
      yield currentState.copyWith(inProgress: true);
      List<Comite> comites = await ComiteProvider.getAll(); 
      yield currentState.success(comites);
    }
  }
}
