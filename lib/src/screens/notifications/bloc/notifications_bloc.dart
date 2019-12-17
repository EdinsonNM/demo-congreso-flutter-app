import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/models/notification.dart';
import 'package:congreso_incca/src/providers/notification.provider.dart';
import './bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  @override
  NotificationsState get initialState => NotificationsState.empty();

  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    if(event is LoadNotificationsEvent){
      yield currentState.copyWith(inProgress: true);
      List<Notification> notifications = await NotificationProvider.getAll();
      yield currentState.copyWith(notifications: notifications, inProgress: false);
      
    }
  }
}
