import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SocialnetworksEvent extends Equatable {
  SocialnetworksEvent([List props = const <dynamic>[]]) : super(props);
}


class LoadSocialnetworksEvent extends SocialnetworksEvent{
  @override
  String toString() => 'LoadSocialnetworksEvent';
}
