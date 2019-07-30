import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt_provider/authentication/AuthenticationState.dart';


class MyAuthState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AuthenticationStateProvider(),
      child: Container(
        child: buildCheckBoxListTile(),
      ),
    );
  }

  Widget buildCheckBoxListTile() {
    return Consumer<AuthenticationStateProvider>(
      builder: (context, authState, _) => Stack(
        children: [
          CheckboxListTile(
            title:
                Text("AuthState: ${authState.authenticationState.toString()}"),
            value: authState.isAuthenticated(),
            secondary: const Icon(Icons.lock),
            onChanged: (bool value) {
              setAuthenticationState(authState);
            },
          ),
        ],
      ),
    );
  }

  void setAuthenticationState(AuthenticationStateProvider authState) {
    if (authState.authenticationState == AuthenicationState.Uninitialized) {
      authState.setStateAuthenticated();
    } else {
      authState.setStateUninitalized();
    }
  }
}
