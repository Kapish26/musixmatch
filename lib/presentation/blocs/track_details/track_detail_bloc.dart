import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:musixmatch/injection_service.dart';
import 'package:musixmatch/services/api_service.dart';

part 'track_detail_event.dart';
part 'track_detail_state.dart';

class TrackDetailBloc extends Bloc<TrackDetailEvent, TrackDetailState> {
  final apiService = injector.get<ApiService>();
  TrackDetailBloc() : super(TrackDetailLoadingState()) {
    on<GetTrackDetailEvent>((event, emit) async {
      try {
        emit(TrackDetailLoadingState());
        var result = await apiService.getTrackDetails(trackId: event.trackId);
        emit(TrackDetailLoadedState(trackDetails: result));
      } catch (e) {
        emit(TrackDetailErrorState(e.toString()));
      }
    });
  }
}
