class Bookmarkmodel {
  String title;
  String url;
  String imageToUrl;
  Bookmarkmodel(
    this.title,
    this.url,
    this.imageToUrl,
  );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Bookmarkmodel &&
        other.title == title &&
        other.url == url &&
        other.imageToUrl == imageToUrl;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => title.hashCode ^ url.hashCode ^ imageToUrl.hashCode;
}
