part of 'track_list_bloc.dart';

abstract class TrackListEvent extends Equatable {
  const TrackListEvent();
}

class GetTrackListEvent extends TrackListEvent {
  final int pageSize;

  const GetTrackListEvent({this.pageSize = 10});
  @override
  List<Object?> get props => [];
}
