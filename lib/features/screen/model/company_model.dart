class Company {
  String companyId;
  String name;
  String email;
  String phone;
  String? logo;
  String industry;
  String? website;
  String? companySize;
  String? about;
  String location;
  List<String>? postedJobs; // List of Job IDs posted by the company
  Map<String, List<String>>?
      applicationsReceived; // jobId -> list of applicant IDs

  Company({
    required this.companyId,
    required this.name,
    required this.email,
    required this.phone,
    this.logo,
    required this.industry,
    this.website,
    this.companySize,
    this.about,
    required this.location,
    this.postedJobs,
    this.applicationsReceived,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'name': name,
      'email': email,
      'phone': phone,
      'logo': logo,
      'industry': industry,
      'website': website,
      'companySize': companySize,
      'about': about,
      'location': location,
      'postedJobs': postedJobs,
      'applicationsReceived': applicationsReceived,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      companyId: map['companyId'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      logo: map['logo'],
      industry: map['industry'],
      website: map['website'],
      companySize: map['companySize'],
      about: map['about'],
      location: map['location'],
      postedJobs: List<String>.from(map['postedJobs'] ?? []),
      applicationsReceived: (map['applicationsReceived'] as Map?)
          ?.map((key, value) => MapEntry(key, List<String>.from(value))),
    );
  }
}
