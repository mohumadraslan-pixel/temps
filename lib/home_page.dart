import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("start Home");
  }

  @override
  void dispose() {
    print("finish Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("welcome to Home Page"),
            ElevatedButton(
              onPressed: () {
                // Login reaches Home with go(), so there may be no route to pop.
                Database.isLoggedIn = false;
                context.go("/login");
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}