class FileUploadDto {
  final String fields;

  FileUploadDto({required this.fields});

  Map<String,dynamic> toEncoded(){
    return {
      'fields':fields
    };
  }
}
