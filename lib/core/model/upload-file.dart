
import 'dart:convert';

List<UploadFile> uploadFileFromJson(String str) => List<UploadFile>.from(json.decode(str).map((x) => UploadFile.fromJson(x)));

String uploadFileToJson(List<UploadFile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadFile {
  int? id;
  String? url;

  UploadFile({
    this.id,
    this.url,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}
