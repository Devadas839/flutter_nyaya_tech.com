import 'dart:convert';

DocumentsUploadResponse documentsUploadResponseFromJson(String str) =>
    DocumentsUploadResponse.fromJson(json.decode(str));

String documentsUploadResponseToJson(DocumentsUploadResponse data) =>
    json.encode(data.toJson());

class DocumentsUploadResponse {
  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  List<String>? field;

  DocumentsUploadResponse({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.field,
  });

  factory DocumentsUploadResponse.fromJson(Map<String, dynamic> json) =>
      DocumentsUploadResponse(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        field: json["field"] == null
            ? []
            : List<String>.from(json["field"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "field": field == null ? [] : List<dynamic>.from(field!.map((x) => x)),
      };
}


// import 'dart:convert';

// DocumentsUploadResponse documentsUploadResponseFromJson(String str) =>
//     DocumentsUploadResponse.fromJson(json.decode(str));

// String documentsUploadResponseToJson(DocumentsUploadResponse data) =>
//     json.encode(data.toJson());

// class DocumentsUploadResponse {
//   int? code;
//   String? message;
//   Data? data;
//   String? id;
//   String? collectionId;
//   String? collectionName;
//   DateTime? created;
//   DateTime? updated;
//   List<String>? field;

//   DocumentsUploadResponse({
//     this.code,
//     this.message,
//     this.data,
//     this.id,
//     this.collectionId,
//     this.collectionName,
//     this.created,
//     this.updated,
//     this.field,
//   });

//   factory DocumentsUploadResponse.fromJson(Map<String, dynamic> json) =>
//       DocumentsUploadResponse(
//         code: json["code"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         id: json["id"],
//         collectionId: json["collectionId"],
//         collectionName: json["collectionName"],
//         created:
//             json["created"] == null ? null : DateTime.parse(json["created"]),
//         updated:
//             json["updated"] == null ? null : DateTime.parse(json["updated"]),
//         field: json["field"] == null
//             ? []
//             : List<String>.from(json["field"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data?.toJson(),
//         "id": id,
//         "collectionId": collectionId,
//         "collectionName": collectionName,
//         "created": created?.toIso8601String(),
//         "updated": updated?.toIso8601String(),
//         "field": field == null ? [] : List<dynamic>.from(field!.map((x) => x)),
//       };
// }

// class Data {
//   Field? field;

//   Data({
//     this.field,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         field: json["field"] == null ? null : Field.fromJson(json["field"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "field": field?.toJson(),
//       };
// }

// class Field {
//   String? code;
//   String? message;

//   Field({
//     this.code,
//     this.message,
//   });

//   factory Field.fromJson(Map<String, dynamic> json) => Field(
//         code: json["code"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//       };
// }
