// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proposal _$ProposalFromJson(Map<String, dynamic> json) => Proposal(
      speakerName: json['speakerName'] as String,
      speakerEmail: json['speakerEmail'] as String,
      talkTitle: json['talkTitle'] as String,
      talkDescription: json['talkDescription'] as String,
      talkSummary: json['talkSummary'] as String?,
    );

Map<String, dynamic> _$ProposalToJson(Proposal instance) => <String, dynamic>{
      'speakerName': instance.speakerName,
      'speakerEmail': instance.speakerEmail,
      'talkTitle': instance.talkTitle,
      'talkDescription': instance.talkDescription,
      'talkSummary': instance.talkSummary,
    };
