import 'package:flutter/material.dart';
import 'dart:math';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff193F59),
                  Color(0xFFA4EAFE),
                  Color(0xFF2E6F8B),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 300,
              width: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cap.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi * _animation.value),
                      child: _animation.value < 0.5
                          ? GlassmorphicCard(
                              child: LoginForm(
                                onRegister: _flipCard,
                              ),
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: GlassmorphicCard(
                                child: SignUpForm(
                                  onLogin: _flipCard,
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final Widget child;

  const GlassmorphicCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final VoidCallback onRegister;
  final _formKey = GlobalKey<FormState>();

  LoginForm({required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Icon(Icons.email, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegExp.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Icon(Icons.lock, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Perform login action
              }
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: onRegister,
            child: const Text(
              'Don\'t have an account? Register',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final VoidCallback onLogin;
  final _formKey = GlobalKey<FormState>();

  SignUpForm({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Icon(Icons.email, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegExp.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Icon(Icons.lock, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'User Name',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: Icon(Icons.person, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Role',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelStyle: TextStyle(color: Colors.white),
            ),
            items: ['Student', 'Teacher']
                .map((role) => DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    ))
                .toList(),
            onChanged: (value) {
              // Handle role selection
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select your role';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Perform sign up action
              }
            },
            child: const Text('Sign Up'),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: onLogin,
            child: const Text(
              'Already have an account? Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
