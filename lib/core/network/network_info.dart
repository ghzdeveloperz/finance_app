import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_service.dart';

class NetworkInfo {
  final ConnectivityService _service;

  const NetworkInfo(this._service);

  Future<bool> get isConnected async {
    final result = await _service.check();
    return !result.contains(ConnectivityResult.none);
  }
}