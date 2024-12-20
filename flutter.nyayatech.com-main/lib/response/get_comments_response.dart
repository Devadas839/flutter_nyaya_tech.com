// To parse this JSON data, do
//
//     final allcommentsResponse = allcommentsResponseFromJson(jsonString);

import 'dart:convert';

AllcommentsResponse allcommentsResponseFromJson(String str) => AllcommentsResponse.fromJson(json.decode(str));

String allcommentsResponseToJson(AllcommentsResponse data) => json.encode(data.toJson());

class AllcommentsResponse {
    bool? success;
    String? message;
    int? status;
    Data? data;

    AllcommentsResponse({
        this.success,
        this.message,
        this.status,
        this.data,
    });

    factory AllcommentsResponse.fromJson(Map<String, dynamic> json) => AllcommentsResponse(
        success: json["success"],
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    PaginationInfo? paginationInfo;
    List<Commentdata>? data;

    Data({
        this.paginationInfo,
        this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        data: json["data"] == null ? [] : List<Commentdata>.from(json["data"]!.map((x) => Commentdata.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Commentdata {
    int? id;
    int? caseId;
    String? message;
    String? attachmentKey;
    String? type;
    int? replyTo;
    int? userId;
    String? userProfilePic;
    DateTime? createdAt;

    Commentdata({
        this.id,
        this.caseId,
        this.message,
        this.attachmentKey,
        this.type,
        this.replyTo,
        this.userId,
        this.userProfilePic,
        this.createdAt,
    });

    factory Commentdata.fromJson(Map<String, dynamic> json) => Commentdata(
        id: json["id"],
        caseId: json["case_id"],
        message: json["message"],
        attachmentKey: json["attachment_key"],
        type: json["type"],
        replyTo: json["reply_to"],
        userId: json["user_id"],
        userProfilePic: json["user_profile_pic"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "message": message,
        "attachment_key": attachmentKey,
        "type": type,
        "reply_to": replyTo,
        "user_id": userId,
        "user_profile_pic": userProfilePic,
        "created_at": createdAt?.toIso8601String(),
    };
}

class PaginationInfo {
    int? totalRecords;
    int? totalPages;
    int? pageSize;
    int? currentPage;
    int? nextPage;
    dynamic prevPage;

    PaginationInfo({
        this.totalRecords,
        this.totalPages,
        this.pageSize,
        this.currentPage,
        this.nextPage,
        this.prevPage,
    });

    factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalRecords: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_records": totalRecords,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}
