class CommentsDto {
  final String comments;

  CommentsDto({required this.comments});

  Map<String, dynamic> toJson() {
    return {'content': comments};
  }
}
