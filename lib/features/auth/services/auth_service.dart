import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/shared/widgets/user_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<void> signIn(String email, String password, WidgetRef ref) async {
    try {
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;

      if (user == null) {
        throw Exception('Signup failed: No user returned.');
      }

      final profile =
          await _supabase
              .from('clients')
              .select('*')
              .eq('id', user.id)
              .single();

      ref.read(userProvider.notifier).state = UserProfile(
        id: user.id,
        email: user.email!,
        fullName: profile['full_name'],
        phone: profile['phone'],
        gender: profile['gender'],
        dob: profile['dob'],
      );
    } on AuthException catch (e) {
      // Cleanly extract only the message
      throw Exception(e.message);
    } catch (e) {
      // Catch all other errors (e.g., network, DB insert)
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  // Sign up with email and password
  Future<void> signUp(
    String email,
    String password,
    String name,
    String number,
    String dob,
    String gender,
  ) async {
    try {
      final AuthResponse res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = res.user;

      if (user == null) {
        throw Exception('Signup failed: No user returned.');
      }

      await _supabase.from('clients').insert({
        'id': user.id,
        'email': email,
        'full_name': name,
        'phone': number,
        'dob': dob,
        'gender': gender,
      });
    } on AuthException catch (e) {
      // Cleanly extract only the message
      throw Exception(e.message);
    } catch (e) {
      // Catch all other errors (e.g., network, DB insert)
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      print('Signed out');
    } catch (e) {
      print('Sign out error: $e');
    }
  }

  getCurrentUser() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user;
  }
}
