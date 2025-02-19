class AboutUs {
  final String title;
  final String member;
  final String location;
  final String intro;
  final String visi;
  final List<String> misi;

  AboutUs({
    required this.title,
    required this.member,
    required this.location,
    required this.intro,
    required this.visi,
    required this.misi,
  });

  // Convert JSON ke Object
  factory AboutUs.fromJson(Map<String, dynamic> json) {
    return AboutUs(
      title: json['title'],
      member: json['member'],
      location: json['location'],
      intro: json['intro'] ?? "",
      visi: json['visi'] ?? "",
      misi: List<String>.from(json['misi'] ?? []),
    );
  }

  // Convert Object ke JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'member': member,
      'location' : location,
      'intro': intro,
      'visi': visi,
      'misi': misi,
    };
  }
}
