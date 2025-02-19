class ContributionModel {
  final String title;
  final String intro;
  final List<String> contribution;

  ContributionModel({
    required this.title,
    required this.intro,
    required this.contribution
  });

  // Convert JSON ke Object
  factory ContributionModel.fromJson(Map<String,dynamic> json) {
    return ContributionModel(
      title: json['title'], 
      intro: json['intro'], 
      contribution: json['contribution']);
  }

  // Convert Object ke JSON
  Map<String,dynamic> toJson() {
    return {
      'title': title,
      'intro': intro,
      'contribution': contribution
    };
  }
}