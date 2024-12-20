class CreateCaseDto {
  final String serviceTitle;
  final String caseType;
  final String issueTitle;
  final String? description;
  CreateCaseDto(
      {required this.serviceTitle,
      required this.caseType,
      required this.issueTitle,
      this.description});
  Map<String, dynamic> toJson() {
    return {
      'service_title': serviceTitle,
      'case_type': caseType,
      'issue_title': issueTitle,
      'description':description
    };
  }
}
