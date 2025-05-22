import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health/components/CustomFormInput.dart';
import 'package:health/screens/login_screen.dart';

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
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value != _passCtl.value.text) {
      return 'Password must be the same';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      print('Email: ${_emailCtl.text}');
      print('Password: ${_passCtl.text}');
      print('Name: ${_nameCtl.text}');
      print('DOB: ${_dobCtl.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/logo.png', height: size.height * 0.10),
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
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: const TextStyle(color: Colors.green),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: open terms link
                              },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(color: Colors.green),
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
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
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
