import 'package:flutter/foundation.dart';

enum AuthenicationState {
  Uninitialized,
  Loading,
  Authenticated,
  UnAuthenticated
}

class AuthenticationStateProvider with ChangeNotifier {
  AuthenicationState _authenticationState = AuthenicationState.Uninitialized;

  AuthenicationState get authenticationState => _authenticationState;

  set authenticationState(AuthenicationState value) {
    _authenticationState = value;
    debugPrintState();
    notifyListeners();
  }

  bool isAuthenticated() {
    return _authenticationState == AuthenicationState.Authenticated ? true : false;
  }

  void setStateLoading() {
    authenticationState = AuthenicationState.Loading;
  }

  void setStateUninitalized() {
    authenticationState = AuthenicationState.Uninitialized;
  }

  void setStateAuthenticated() {
    authenticationState = AuthenicationState.Authenticated;
  }

  void debugPrintState() {
    print("AuthState:${_authenticationState.toString()}");
  }
}
