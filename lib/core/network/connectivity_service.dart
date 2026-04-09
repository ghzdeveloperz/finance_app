import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity;

  const ConnectivityService(this._connectivity);

  Future<List<ConnectivityResult>> check() {
    return _connectivity.checkConnectivity();
  }

  Stream<List<ConnectivityResult>> observe() {
    return _connectivity.onConnectivityChanged;
  }
}