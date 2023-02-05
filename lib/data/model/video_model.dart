class VideoModel {
  final int id;
  final String caption;
  final String videoUrl;
  final String createdAt;

  VideoModel({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.createdAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] as int? ?? 0,
      caption: json['caption'] as String? ?? "",
      videoUrl: json['video_url'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
    );
  }
}
