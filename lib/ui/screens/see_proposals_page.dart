import 'package:cfp_flutter_ai_summary/models/proposal.dart';
import 'package:cfp_flutter_ai_summary/providers/proposal_provider.dart';
import 'package:flutter/material.dart';

class SeeProposalsPage extends StatelessWidget {
  final ProposalProvider proposalProvider;

  SeeProposalsPage({
    required this.proposalProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("See Proposals"),
      ),
      body: FutureBuilder<List<Proposal>>(
          future: proposalProvider.listProposals(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final proposals = snapshot.data ?? [];

            if (!snapshot.hasData || proposals.isEmpty) {
              return Center(
                child: Text(
                  "No proposals yet :( )",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            }

            return ListView.builder(
              itemCount: proposals.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(proposals[index].talkTitle),
                    subtitle: Text(proposals[index].talkSummary ?? 'N/A'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              proposals[index].speakerName,
                            ),
                            Text(proposals[index].speakerEmail),
                          ],
                        ),
                        IconButton(
                          tooltip: 'Accept',
                          icon: const Icon(
                            Icons.check,
                            size: 30.0,
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            /// TODO: implement accept
                          },
                        ),
                        IconButton(
                          tooltip: 'Reject',
                          icon: const Icon(
                            Icons.close,
                            size: 30.0,
                          ),
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            /// TODO: implement accept
                          },
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }),
    );
  }
}
