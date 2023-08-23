import 'package:json_annotation/json_annotation.dart';

part 'proposal.g.dart';

@JsonSerializable()
class Proposal {
  final String speakerName;
  final String speakerEmail;
  final String talkTitle;
  final String talkDescription;
  final String? talkSummary;

  Proposal({
    required this.speakerName,
    required this.speakerEmail,
    required this.talkTitle,
    required this.talkDescription,
    this.talkSummary,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalToJson(this);
}
