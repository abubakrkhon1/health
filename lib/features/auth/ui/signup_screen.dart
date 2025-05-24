import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health/components/CustomFormInput.dart';
import 'package:health/features/auth/ui/login_screen.dart';
import 'package:health/features/main_nav/ui/main_nav_page.dart';
import 'package:health/theme/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  final _dobCtl = TextEditingController();
  final _confirmPassCtl = TextEditingController();

  bool loading = false;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value != _passCtl.value.text) {
      return 'Password must be the same';
    }
    return null;
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await Future.delayed(const Duration(seconds: 2));

      print('Email: ${_emailCtl.text}');
      print('Password: ${_passCtl.text}');
      print('Name: ${_nameCtl.text}');
      print('DOB: ${_dobCtl.text}');

      showSuccessModal(context);

      setState(() {
        loading = false;
      });
    }
  }

  void showSuccessModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder:
          (context) => SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(
                      context,
                    ).viewInsets.bottom, // 👈 adjusts for keyboard
                left: 20,
                right: 20,
                top: 40,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified, // or use a custom image/icon
                      color: Colors.green,
                      size: 64,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Verification code sent!',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter verification code sent to your email to continue',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontSize: 14, color: Colors.black54),
                    ),
                    TextField(),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close modal
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainNavigationPage(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Enter Code',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: size.height * 0.10,
                ),
                SizedBox(height: 20),
                CustomFormInput(
                  controller: _nameCtl,
                  hintText: 'Full Name',
                  validator: _validateName,
                ),

                const SizedBox(height: 10),

                Text('Enter your name and surname to continue'),

                const SizedBox(height: 10),

                CustomFormInput(
                  controller: _emailCtl,
                  hintText: 'Enter your email',
                  validator: _validateEmail,
                ),

                const SizedBox(height: 10),

                Text('Enter your email'),

                const SizedBox(height: 10),

                CustomFormInput(
                  controller: _dobCtl,
                  hintText: 'Date of birth (DD/MM/YYYY)',
                  validator: _validateDOB,
                ),

                const SizedBox(height: 10),

                Text('To sign up, you must be at least 18 years old'),

                const SizedBox(height: 10),

                CustomFormInput(
                  controller: _passCtl,
                  hintText: 'Password',
                  obscureText: true,
                  validator: _validatePassword,
                ),

                const SizedBox(height: 20),

                CustomFormInput(
                  controller: _confirmPassCtl,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  validator: _validateConfirmPassword,
                ),

                const SizedBox(height: 10),

                Text.rich(
                  TextSpan(
                    text: 'By selecting "Sign Up", you agree to our ',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.green),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: open terms link
                              },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.green),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: open privacy link
                              },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:
                      loading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : Text(
                            'Sign Up',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: Colors.white),
                          ),
                ),

                const SizedBox(height: 8),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
