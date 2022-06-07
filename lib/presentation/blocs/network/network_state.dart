part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkConnectionInitial extends NetworkState {
  @override
  List<Object?> get props => [];
}

class NetworkConnectionSuccess extends NetworkState {
  @override
  List<Object?> get props => [];
}

class NetworkConnectionFailure extends NetworkState {
  @override
  List<Object?> get props => [];
}
