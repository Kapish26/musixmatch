part of 'track_detail_bloc.dart';

abstract class TrackDetailState extends Equatable {
  const TrackDetailState();
}


class TrackDetailLoadingState extends TrackDetailState {
  @override
  List<Object?> get props => [];
}

class TrackDetailLoadedState extends TrackDetailState {
  final Map<String, dynamic> trackDetails;
  const TrackDetailLoadedState({required this.trackDetails});
  @override
  List<Object?> get props => [trackDetails];
}

class TrackDetailErrorState extends TrackDetailState {
  final String error;
  const TrackDetailErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
