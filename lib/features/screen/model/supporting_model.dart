class Education {
  String degree;
  String institute;
  String year;

  Education(
      {required this.degree, required this.institute, required this.year});

  Map<String, dynamic> toMap() => {
        'degree': degree,
        'institute': institute,
        'year': year,
      };

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      degree: map['degree'],
      institute: map['institute'],
      year: map['year'],
    );
  }
}

class Experience {
  String jobTitle;
  String company;
  String years;

  Experience(
      {required this.jobTitle, required this.company, required this.years});

  Map<String, dynamic> toMap() => {
        'jobTitle': jobTitle,
        'company': company,
        'years': years,
      };

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      jobTitle: map['jobTitle'],
      company: map['company'],
      years: map['years'],
    );
  }
}
