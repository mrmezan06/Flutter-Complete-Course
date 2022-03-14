

class PhotoModel{
  final String photourlRaw;
  final String photourlFull;
  final String photourlSmall;
  final String objectId;
  final String height;
  final String width;
  final String description;
  final int likes;

  PhotoModel({
    required this.photourlRaw,
    required this.photourlFull,
    required this.photourlSmall,
    required this.objectId,
    required this.height,
    required this.width,
    required this.description,
    required this.likes
  });
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      photourlRaw: json['urls']['raw'] as String,
      photourlFull: json['urls']['full'] as String,
      photourlSmall: json['urls']['small'] as String,
      objectId: json['id'] as String,
      height: json['height'] as String,
      width: json['width'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int,

    );
  }

}