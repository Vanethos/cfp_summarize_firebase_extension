import 'package:cfp_flutter_ai_summary/firebase_options.dart';
import 'package:cfp_flutter_ai_summary/providers/proposal_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cfp_flutter_ai_summary/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final proposalProvider = ProposalProvider(FirebaseFirestore.instance);

  runApp(
    CFPApp(
      provider: proposalProvider,
    ),
  );
}
