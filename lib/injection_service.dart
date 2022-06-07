import 'package:get_it/get_it.dart';
import 'package:musixmatch/presentation/blocs/network/network_bloc.dart';
import 'package:musixmatch/presentation/blocs/track_details/track_detail_bloc.dart';
import 'package:musixmatch/presentation/blocs/track_list/track_list_bloc.dart';
import 'package:musixmatch/services/api_service.dart';

final injector = GetIt.instance;

void setupDependencies() {
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerSingleton<TrackListBloc>(TrackListBloc());
  injector.registerSingleton<NetworkBloc>(NetworkBloc());
  injector.registerFactory<TrackDetailBloc>(() => TrackDetailBloc());
}

void destroyDependencies() {
  injector.unregister<ApiService>();
  injector.unregister<TrackListBloc>();
  injector.unregister<NetworkBloc>();
  injector.unregister<TrackDetailBloc>();
}
