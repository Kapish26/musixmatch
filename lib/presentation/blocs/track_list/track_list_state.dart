part of 'track_list_bloc.dart';

abstract class TrackListState extends Equatable {
  const TrackListState();
}



class TrackListLoadingState extends TrackListState {
  @override
  List<Object?> get props => [];
}

class TrackListLoadedState extends TrackListState {
  final Tracks tracks;

  const TrackListLoadedState({required this.tracks});
  @override
  List<Object?> get props => [tracks];
}

class TrackListErrorState extends TrackListState {
  final String error;

  const TrackListErrorState(this.error);
  @override
  List<Object?> get props => [];
}
