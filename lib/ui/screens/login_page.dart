import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) => context.goNamed('home'),
        ),
        AuthStateChangeAction<UserCreated>(
          (context, state) => context.goNamed('home'),
        ),
      ],
    );
  }
}
