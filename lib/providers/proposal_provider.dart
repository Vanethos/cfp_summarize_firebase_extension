import 'dart:convert';

import 'package:cfp_flutter_ai_summary/models/proposal.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProposalProvider {
  final FirebaseFirestore firestore;

  const ProposalProvider(this.firestore);

  Future<void> sendProposal(Proposal proposal) async {
    try {
      await firestore.collection('proposals').add(
            proposal.toJson()..removeWhere((key, value) => value == null),
          );
    } catch (e) {
      debugPrint('Error while sending proposal: $e');
      rethrow;
    }
  }

  Future<List<Proposal>> listProposals() async {
    try {
      return firestore
          .collection('proposals')
          .get()
          .then((ref) => ref.docs)
          .then(
            (docs) => docs.map((doc) {
              try {
                print(jsonEncode(doc.data()));
              } catch (e) {
                print(e);
              }

              return Proposal.fromJson(doc.data());
            }).toList(),
          );
    } catch (e) {
      debugPrint('Error while sending proposal: $e');
      rethrow;
    }
  }
}
