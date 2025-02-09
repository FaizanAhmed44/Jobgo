import 'package:jobgo/features/screen/model/supporting_model.dart';

class JobSeeker {
  String uid;
  String name;
  String email;
  String phone;
  String? profileImage;
  DateTime createdAt;
  String? bio;
  List<Education>? education;
  List<Experience>? experience;
  List<String>? skills;
  String? resumeUrl;
  String? portfolioUrl;
  String? location;
  List<String>? appliedJobs; // List of Job IDs

  JobSeeker({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.createdAt,
    this.bio,
    this.education,
    this.experience,
    this.skills,
    this.resumeUrl,
    this.portfolioUrl,
    this.location,
    this.appliedJobs,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'bio': bio,
      'education': education?.map((e) => e.toMap()).toList(),
      'experience': experience?.map((e) => e.toMap()).toList(),
      'skills': skills,
      'resumeUrl': resumeUrl,
      'portfolioUrl': portfolioUrl,
      'location': location,
      'appliedJobs': appliedJobs,
    };
  }

  factory JobSeeker.fromMap(Map<String, dynamic> map) {
    return JobSeeker(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      profileImage: map['profileImage'],
      createdAt: DateTime.parse(map['createdAt']),
      bio: map['bio'],
      education: (map['education'] as List?)
          ?.map((e) => Education.fromMap(e))
          .toList(),
      experience: (map['experience'] as List?)
          ?.map((e) => Experience.fromMap(e))
          .toList(),
      skills: List<String>.from(map['skills'] ?? []),
      resumeUrl: map['resumeUrl'],
      portfolioUrl: map['portfolioUrl'],
      location: map['location'],
      appliedJobs: List<String>.from(map['appliedJobs'] ?? []),
    );
  }
}
