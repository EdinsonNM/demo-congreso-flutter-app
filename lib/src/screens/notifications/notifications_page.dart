import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/models/notification.dart'
    as NotificationModel;
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:congreso_incca/src/screens/notifications/bloc/bloc.dart';
import 'package:congreso_incca/src/screens/notifications/bloc/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatelessWidget {
  Widget _notificationItem(NotificationModel.Notification notification) {
    return ListTile(
      title: Text(notification.title),
      subtitle: Text(notification.description),
    );
  }

  @override
  Widget build(BuildContext context) {
    NotificationsBloc _bloc = BlocProvider.of<NotificationsBloc>(context);
    _bloc.dispatch(LoadNotificationsEvent());
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        bloc: _bloc,
        builder: (BuildContext context, NotificationsState state) {
          return Scaffold(
              appBar: AppBar(title: Text('Alertas')),
              drawer: MainDrawer(),
              body: ListView(
                children: <Widget>[
                  ClipShape(
                    name: 'Alertas',
                    hasImage: true,
                    image: URL_LOGO_APP,
                  ),
                  Column(
                    children: state.notifications
                        .map((NotificationModel.Notification notification) =>
                            _notificationItem(notification))
                        .toList(),
                  )
                ],
              ));
        });
  }
}
