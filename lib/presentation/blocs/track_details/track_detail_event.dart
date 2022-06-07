part of 'track_detail_bloc.dart';

abstract class TrackDetailEvent extends Equatable {
  const TrackDetailEvent();
}

class GetTrackDetailEvent extends TrackDetailEvent {
  final int trackId;

  const GetTrackDetailEvent({required this.trackId});
  @override
  List<Object?> get props => [trackId];
}
