// To parse this JSON data, do
//
//     final caseSummaryResponse = caseSummaryResponseFromJson(jsonString);

import 'dart:convert';

CaseSummaryResponse caseSummaryResponseFromJson(String str) => CaseSummaryResponse.fromJson(json.decode(str));

String caseSummaryResponseToJson(CaseSummaryResponse data) => json.encode(data.toJson());

class CaseSummaryResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    CaseSummaryResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory CaseSummaryResponse.fromJson(Map<String, dynamic> json) => CaseSummaryResponse(
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
    List<CaseSummary>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<CaseSummary>.from(json["records"]!.map((x) => CaseSummary.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
    };
}

class PaginationInfo {
    int? totalCaseSummarys;
    int? totalPages;
    int? pageSize;
    int? currentPage;
    dynamic nextPage;
    dynamic prevPage;

    PaginationInfo({
        this.totalCaseSummarys,
        this.totalPages,
        this.pageSize,
        this.currentPage,
        this.nextPage,
        this.prevPage,
    });

    factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalCaseSummarys: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_records": totalCaseSummarys,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}

class CaseSummary {
    int? id;
    int? caseId;
    DateTime? date;
    String? note;
    int? createdBy;
    int? updatedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    CaseSummary({
        this.id,
        this.caseId,
        this.date,
        this.note,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory CaseSummary.fromJson(Map<String, dynamic> json) => CaseSummary(
        id: json["id"],
        caseId: json["case_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        note: json["note"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "date": date?.toIso8601String(),
        "note": note,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
