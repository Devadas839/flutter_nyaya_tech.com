import 'dart:convert';

ViewCasesNotesResponse viewCasesNotesResponseFromJson(String str) =>
    ViewCasesNotesResponse.fromJson(json.decode(str));

String viewCasesNotesResponseToJson(ViewCasesNotesResponse data) =>
    json.encode(data.toJson());

class ViewCasesNotesResponse {
  bool? success;
  String? message;
  int? status;
  ViewNotes? data;

  ViewCasesNotesResponse({
    this.success,
    this.message,
    this.status,
    this.data,
  });

  factory ViewCasesNotesResponse.fromJson(Map<String, dynamic> json) =>
      ViewCasesNotesResponse(
        success: json["success"],
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? null : ViewNotes.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class ViewNotes {
  int? id;
  int? caseId;
  String? title;
  String? note;
  int? createdBy;
  String? createdByName;
  String? createdByProfilePic;
  dynamic updatedBy;
  dynamic updatedByName;
  dynamic updatedByProfilePic;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  ViewNotes({
    this.id,
    this.caseId,
    this.title,
    this.note,
    this.createdBy,
    this.createdByName,
    this.createdByProfilePic,
    this.updatedBy,
    this.updatedByName,
    this.updatedByProfilePic,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ViewNotes.fromJson(Map<String, dynamic> json) => ViewNotes(
        id: json["id"],
        caseId: json["case_id"],
        title: json["title"],
        note: json["note"],
        createdBy: json["created_by"],
        createdByName: json["created_by_name"],
        createdByProfilePic: json["created_by_profile_pic"],
        updatedBy: json["updated_by"],
        updatedByName: json["updated_by_name"],
        updatedByProfilePic: json["updated_by_profile_pic"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "title": title,
        "note": note,
        "created_by": createdBy,
        "created_by_name": createdByName,
        "created_by_profile_pic": createdByProfilePic,
        "updated_by": updatedBy,
        "updated_by_name": updatedByName,
        "updated_by_profile_pic": updatedByProfilePic,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
