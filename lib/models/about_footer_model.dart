class AboutFooterModel {
  final String title;
  final String titleDesc;
  final String subTitle;
  final List<String> subTitleDesc;

  AboutFooterModel({
    required this.title,
    required this.titleDesc,
    required this.subTitle,
    required this.subTitleDesc
  });

  // Convert JSON to Object
  factory AboutFooterModel.fromJson(Map<String,dynamic> json) {
    return AboutFooterModel(
      title: json['title'], 
      titleDesc: json['titleDesc'], 
      subTitle: json['subTitle'],
      subTitleDesc: json['subTitleDesc'],
      );
  }
}