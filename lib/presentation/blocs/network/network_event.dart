part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();
}

class ListenConnection extends NetworkEvent {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ConnectionChanged extends NetworkEvent {
  NetworkState connection;
  ConnectionChanged(this.connection);
  @override
  List<Object?> get props => [];
}
