import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soulscripter/providers/auth_provider.dart';
import 'package:soulscripter/screens/main_screen.dart';
import 'package:soulscripter/widgets/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Store login in AuthProvider so it persists
      await Provider.of<AuthProvider>(context, listen: false).login(_email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in as ${_email.split('@')[0]}')),
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: Stack(
        children: [
          // Background shimmer
          Positioned.fill(
            child: Shimmer(
              duration: const Duration(seconds: 4),
              color: primaryColor.withOpacity(0.3),
              colorOpacity: 0.6,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor.withOpacity(0.2),
                      primaryColor.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset('assets/images/logo.png', width: 70),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Welcome to SoulScripter',
                    style: GoogleFonts.pacifico(
                      fontSize: 34,
                      color: primaryColor,
                      shadows: [
                        const Shadow(
                          blurRadius: 6,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Capture & Share your soul\'s voice',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r"^[\w\.-]+@[\w\.-]+\.\w+$",
                            ).hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value!.trim(),
                        ),
                        const SizedBox(height: 24),

                        // Password Field
                        TextFormField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value!,
                        ),
                        const SizedBox(height: 38),

                        // Gradient Login Button
                        GradientButton(
                          text: 'Log In',
                          onPressed: _submit,
                          gradientColors: [
                            primaryColor,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          borderRadius: 16,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          showShadow: true,
                          textStyle: GoogleFonts.pacifico(
                            fontSize: 18,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Theme.of(context).focusColor,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Sign Up prompt
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to Sign Up screen
                          },
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
