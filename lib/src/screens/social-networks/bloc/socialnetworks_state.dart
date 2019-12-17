import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SocialnetworksState extends Equatable {
  SocialnetworksState([List props = const <dynamic>[]]) : super(props);
}

class InitialSocialnetworksState extends SocialnetworksState {}
