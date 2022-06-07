import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late StreamSubscription _subscription;
  NetworkBloc() : super(NetworkConnectionInitial()) {
    on<ListenConnection>((event, emit) {
      _subscription = DataConnectionChecker().onStatusChange.listen((status) {
        add(ConnectionChanged(status == DataConnectionStatus.disconnected
            ? NetworkConnectionFailure()
            : NetworkConnectionSuccess()));
      });
    });
    on<ConnectionChanged>((event, emit) {
      emit(event.connection);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
