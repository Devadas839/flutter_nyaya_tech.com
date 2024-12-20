class AddNotesDto {
  final int caseid;
  final String title;
  final String note;
  AddNotesDto({required this.caseid, required this.title, required this.note});
  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'title': title, 'note': note};
  }
}
