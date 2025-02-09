class Job {
  String jobId;
  String title;
  String companyId;
  String companyName;
  String location;
  String jobType; // Full-time, Part-time, Internship
  String salaryRange;
  List<String> requirements;
  DateTime postedAt;
  List<String>? applicants; // List of user IDs who applied

  Job({
    required this.jobId,
    required this.title,
    required this.companyId,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.salaryRange,
    required this.requirements,
    required this.postedAt,
    this.applicants,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'title': title,
      'companyId': companyId,
      'companyName': companyName,
      'location': location,
      'jobType': jobType,
      'salaryRange': salaryRange,
      'requirements': requirements,
      'postedAt': postedAt.toIso8601String(),
      'applicants': applicants,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      jobId: map['jobId'],
      title: map['title'],
      companyId: map['companyId'],
      companyName: map['companyName'],
      location: map['location'],
      jobType: map['jobType'],
      salaryRange: map['salaryRange'],
      requirements: List<String>.from(map['requirements']),
      postedAt: DateTime.parse(map['postedAt']),
      applicants: List<String>.from(map['applicants'] ?? []),
    );
  }
}
