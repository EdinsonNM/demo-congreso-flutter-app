import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/libs/SimpleBlocDelegate.dart';
import 'package:congreso_incca/src/screens/notifications/bloc/notifications_bloc.dart';
import 'package:congreso_incca/src/screens/notifications/notifications_page.dart';
import 'package:congreso_incca/src/screens/programs/programs_page.dart';
import 'package:congreso_incca/src/screens/social-networks/bloc/bloc.dart';
import 'package:congreso_incca/src/screens/social-networks/socialnetworks_page.dart';
import 'package:congreso_incca/src/screens/speakers/bloc/speakers_bloc.dart';
import 'package:congreso_incca/src/screens/speakers/speakers_page.dart';
import 'package:congreso_incca/src/screens/sponsors/sponsors_page.dart';
import 'package:congreso_incca/src/screens/survey/survey_page.dart';
import 'package:congreso_incca/src/screens/tourism/bloc/bloc.dart';
import 'package:congreso_incca/src/screens/tourism/tourism_page.dart';
import 'package:congreso_incca/src/screens/welcome/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './src/constants/theme/default-theme.dart';
import './src/constants/routes/routes-ui.dart';
import './src/screens/home/home.dart';
import './src/screens/locations/locations.dart';
import './src/screens/sponsors/bloc/bloc.dart';
import './src/screens/programs/bloc/bloc.dart';
import './src/screens/welcome/welcome_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   DatabaseReference _tokenReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      print(token);
      _tokenReference.child('tokens/$token').push().set(true);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProgramsBloc>(
              builder: (BuildContext context) => ProgramsBloc()),
          BlocProvider<SponsorsBloc>(
              builder: (BuildContext context) => SponsorsBloc()),
          BlocProvider<SocialnetworksBloc>(
              builder: (BuildContext context) => SocialnetworksBloc()),
          BlocProvider<WelcomeBloc>(
              builder: (BuildContext context) => WelcomeBloc()),
          BlocProvider<SpeakersBloc>(
              builder: (BuildContext context) => SpeakersBloc()),
          BlocProvider<TourismBloc>(
              builder: (BuildContext context) => TourismBloc()),
          BlocProvider<NotificationsBloc>(
              builder: (BuildContext context) => NotificationsBloc())
        ],
        child: new MaterialApp(
          title: TITLE_APP,
          debugShowCheckedModeBanner: false,
          theme: themeDefault,
          home: HomePage(),
          routes: <String, WidgetBuilder>{
            Routes.home: (BuildContext context) => new HomePage(),
            Routes.welcome: (BuildContext context) => new WelcomePage(),
            Routes.program: (BuildContext context) => new ProgramsPage(),
            Routes.locations: (BuildContext context) => new LocationsPage(),
            Routes.speakers: (BuildContext context) => new SpeakersPage(),
            Routes.sponsors: (BuildContext context) => new SponsorsPage(),
            Routes.locations: (BuildContext context) => new LocationsPage(),
            Routes.tourism: (BuildContext context) => new TourismPage(),
            Routes.notifications: (BuildContext context) =>
                new NotificationsPage(),
            Routes.socialnetworks: (BuildContext context) =>
                new SocialNetworksPage(),
            Routes.survey: (BuildContext context) => new SurveyPage(),
          },
        ));
  }
}
