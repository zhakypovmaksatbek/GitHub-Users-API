enum ImageEnum { github }

extension ImageExtension on ImageEnum {
  String get imagePath => 'assets/images/$name.png';
}
