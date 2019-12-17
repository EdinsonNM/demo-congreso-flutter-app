import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/tourism.dart';
import 'package:congreso_incca/src/providers/tourism.provider.dart';
import './bloc.dart';

class TourismBloc extends Bloc<TourismEvent, TourismState> {
  @override
  TourismState get initialState => TourismState.empty();

  @override
  Stream<TourismState> mapEventToState(
    TourismEvent event,
  ) async* {
    if(event is LoadTourismEvent){
      List<Tourism> data = await TourismProvider.getAll();
      yield currentState.copyWith(tourismList: data, inProgress: false);
    }
  }
}
