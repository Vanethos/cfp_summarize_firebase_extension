import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('send-proposal'),
              child: const Text("Send Proposal"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.goNamed('see-proposals'),
              child: const Text("See Proposals"),
            ),
          ],
        ),
      ),
    );
  }
}
