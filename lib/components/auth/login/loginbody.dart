import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Track loading state
  String? _errorMessage; // Track error messages

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Username Input Field
          _buildTextField(
            controller: usernameController,
            hint: 'username',
            icon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter username';
              }
              return null;
            },
          ),
          // Password Input Field
          _buildTextField(
            controller: passwordController,
            hint: 'password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),
          // Error Message Display
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          // Forgot Password Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: oxfordBlue, fontSize: 13),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          // Login Button
          ElevatedButton(
            onPressed: _isLoading ? null : _login, // Disable when loading
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(oxfordBlue),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white) // Show loading indicator
                    : Text(
                        'Login',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: white,
                              fontWeight: FontWeight.bold,
                              height: 3,
                            ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.grey),
          SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              validator: validator,
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
        _errorMessage = null; // Clear previous errors
      });

      try {
        await Provider.of<UserModel>(context, listen: false).login(
          "exampleUser",
          "examplePassword123",
        );

        // Check if the widget is still mounted before using context
        if (!mounted) return;

        // Use GoRouter to navigate
        if (Provider.of<UserModel>(context, listen: false).isLogged) {
          GoRouter.of(context).go('/');
        } else {
          setState(() {
            _errorMessage = 'Login failed. Please check your credentials.';
          });
        }
      } catch (e) {
        if (!mounted) return;

        setState(() {
          _errorMessage = 'Login failed: ${e.toString()}';
        });
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false; // Stop loading
          });
        }
      }
    }
  }
}
