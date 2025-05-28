import 'package:flutter/material.dart';
import 'package:health/features/onboarding/ui/onboarding_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  final Widget child;

  const AuthGate({super.key, required this.child});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final Stream<AuthState> _authState;

  @override
  void initState() {
    super.initState();
    _authState = Supabase.instance.client.auth.onAuthStateChange;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: _authState,
      builder: (context, snapshot) {
        final user = Supabase.instance.client.auth.currentUser;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return user == null ? const OnboardingScreen() : widget.child;
      },
    );
  }
}
