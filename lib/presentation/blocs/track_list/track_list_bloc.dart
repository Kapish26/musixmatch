import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:musixmatch/injection_service.dart';
import 'package:musixmatch/models/tracks.dart';
import 'package:musixmatch/services/api_service.dart';

part 'track_list_event.dart';
part 'track_list_state.dart';

class TrackListBloc extends Bloc<TrackListEvent, TrackListState> {
  final ApiService apiService = injector.get<ApiService>();
  TrackListBloc() : super(TrackListLoadingState()) {
    on<GetTrackListEvent>((event, emit) async {
      try {
        emit(TrackListLoadingState());
        var result = await apiService.getTrackList(event.pageSize);
        emit(TrackListLoadedState(tracks: result));
      } catch (e) {
        emit(TrackListErrorState(e.toString()));
      }
    });
  }
}
