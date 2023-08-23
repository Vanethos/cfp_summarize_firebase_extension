import 'package:cfp_flutter_ai_summary/models/proposal.dart';
import 'package:cfp_flutter_ai_summary/providers/proposal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SendProposalPage extends StatefulWidget {
  final ProposalProvider proposalProvider;

  const SendProposalPage({
    required this.proposalProvider,
    super.key,
  });

  @override
  _SendProposalPageState createState() => _SendProposalPageState();
}

class _SendProposalPageState extends State<SendProposalPage> {
  final _formKey = GlobalKey<FormState>();

  final _speakerNameController = TextEditingController();
  final _speakerEmailController = TextEditingController();
  final _talkTitleController = TextEditingController();
  final _talkDescriptionController = TextEditingController();

  InputDecoration _customInputDecoration(String label, String helperText) {
    return InputDecoration(
      labelText: label,
      helperText: helperText,
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send Proposal")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _speakerNameController,
                decoration:
                    _customInputDecoration("Speaker's name", 'REQUIRED'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _speakerEmailController,
                decoration:
                    _customInputDecoration("Speaker's email", 'REQUIRED'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _talkTitleController,
                decoration: _customInputDecoration("Talk title", 'REQUIRED'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _talkDescriptionController,
                decoration: _customInputDecoration(
                    "Talk description", 'REQUIRED, MIN 1000 CHARS'),
                validator: (value) {
                  if (value == null || value.length < 1000) {
                    return 'Description should be at least 1000 characters long';
                  }
                  return null;
                },
                maxLines: 6,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await widget.proposalProvider.sendProposal(
                        Proposal(
                          speakerEmail: _speakerEmailController.text,
                          speakerName: _speakerNameController.text,
                          talkDescription: _talkDescriptionController.text,
                          talkTitle: _talkTitleController.text,
                        ),
                      );

                      if (!mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Proposal Sent!",
                          ),
                        ),
                      );

                      context.pop();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "There was an error sending the proposal, please try again later",
                          ),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  }
                },
                child: const Text("Send proposal"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
