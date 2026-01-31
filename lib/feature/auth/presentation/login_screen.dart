import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// momken nwala3 fe deh 5las
final authControllerProvider = Provider<AsyncValue<void>>(
  (ref) => const AsyncData(null),
);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_FormKey.currentState!.validate()) {
      // TODO: Call your auth controller login method here

      print('Login with: ${_emailController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFD4F1A3),
      body: Center(
        child: Container(
          width: 400,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color(0xAA89E894),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x4D1B5E20))],
          ),
          child: Form(
            key: _FormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "welcom bck babe!!",
                  style: TextStyle(
                    color: Color(0xFF39FF14),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "idk just sign in already",
                  style: TextStyle(color: Color(0xCC2E7D32)),
                ),
                const SizedBox(height: 32),
                //EMAIL PART
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Color(0xFFB2DFAB)),
                  decoration: const InputDecoration(
                    labelText: "EMAIL",
                    labelStyle: TextStyle(
                      color: Color(0xFF6B8E23),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFF0B3D0B),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                //PASSWORD PART
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Color(0xFFB2DFAB)),
                  decoration: const InputDecoration(
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(
                      color: Color(0xFF6B8E23),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFF0B3D0B),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 32),

                //LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: authState.isLoading ? null : _onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFF7FFF00,
                      ), // Chartreuse green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: authState.isLoading
                        ? const CircularProgressIndicator(
                            color: Color(0xFF0D4F0D),
                          )
                        : const Text(
                            "Log In",
                            style: TextStyle(color: Color(0xFF0D4F0D)),
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
}
