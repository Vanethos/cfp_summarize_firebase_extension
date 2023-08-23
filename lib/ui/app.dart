import 'package:cfp_flutter_ai_summary/providers/proposal_provider.dart';
import 'package:cfp_flutter_ai_summary/ui/screens/home_page.dart';
import 'package:cfp_flutter_ai_summary/ui/screens/login_page.dart';
import 'package:cfp_flutter_ai_summary/ui/screens/see_proposals_page.dart';
import 'package:cfp_flutter_ai_summary/ui/screens/send_proposals_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CFPApp extends StatelessWidget {
  final ProposalProvider provider;

  const CFPApp({
    required this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      title: 'Flutte CFP App',
      routerConfig: _router,
    );
  }

  GoRouter get _router => GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'send-proposal',
                  name: 'send-proposal',
                  builder: (context, state) => SendProposalPage(
                    proposalProvider: provider,
                  ),
                ),
                GoRoute(
                  path: 'see-proposals',
                  name: 'see-proposals',
                  builder: (context, state) => SeeProposalsPage(
                    proposalProvider: provider,
                  ),
                ),
              ]),
        ],
      );
}
