// To parse this JSON data, do
//
//     final listCaseDox = listCaseDoxFromJson(jsonString);

import 'dart:convert';

ListCaseDox listCaseDoxFromJson(String str) =>
    ListCaseDox.fromJson(json.decode(str));

String listCaseDoxToJson(ListCaseDox data) => json.encode(data.toJson());

class ListCaseDox {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ListCaseDox({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ListCaseDox.fromJson(Map<String, dynamic> json) => ListCaseDox(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  PaginationInfo? paginationInfo;
  List<Documents>? records;

  Data({
    this.paginationInfo,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null
            ? null
            : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null
            ? []
            : List<Documents>.from(
                json["records"]!.map((x) => Documents.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class PaginationInfo {
  int? totalDocumentss;
  int? totalPages;
  int? pageSize;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  PaginationInfo({
    this.totalDocumentss,
    this.totalPages,
    this.pageSize,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalDocumentss: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalDocumentss,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class Documents {
  int? id;
  int? caseId;
  String? filename;
  String? key;
  int? fileSize;
  String? fileType;
  int? createdBy;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? downloadUrl;

  Documents({
    this.id,
    this.caseId,
    this.filename,
    this.key,
    this.fileSize,
    this.fileType,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.downloadUrl,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        id: json["id"],
        caseId: json["case_id"],
        filename: json["filename"],
        key: json["key"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "filename": filename,
        "key": key,
        "file_size": fileSize,
        "file_type": fileType,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "download_url": downloadUrl,
      };
}
