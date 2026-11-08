// Answers:
// super.key forwards this widget's Key to StatefulWidget, where Flutter uses it
// to match widgets with elements when the tree changes.
// GlobalKey<FormState> is different: _keyForm is a handle to this Form's state
// so the page can call validate(). It is not the widget's identity key.
// const lets Flutter reuse unchanged widget instances during rebuilds, reducing
// allocations and allowing the framework to skip some widget update work.
// A leading underscore makes a name private to this Dart library. Keeping State
// classes private avoids exposing page implementation details as public API.
// Navigation experiment:
// 1. push('/signup') keeps Login on the stack; pop returns to it.
// 2. go('/signup') replaces the current route stack. pop has no Login route to
//    return to and can report that there is nothing to pop.
// 3. go('/signup') then go('/login') navigates directly back to Login.
// 4. push('/signup') then the AppBar/system back pops Signup and shows Login.
// Login is not disposed while Signup is pushed; go to Signup removes Login,
// so its dispose print runs.
// go replaces the current stack with the requested location; push adds a route
// above the current stack so pop can return to the previous route.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (username == Database.username && password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Wrong info")),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print("start Login");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    print("finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter valid username ";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (((value?.length) ?? 0) < 6) {
                    return "please enter valid password";
                  }
                  return null;
                },

                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _inputCheck,
                child: const Text("go to home"),
              ),
              TextButton(
                onPressed: () => context.push("/signup"),
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
