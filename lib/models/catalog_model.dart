class Items {
  static List<String> _postersUrl = [];

  static List<String> _titles = [];

  static List<String> _detailsPageUrls = [];

  static List<String> get postersUrl => _postersUrl;

  static List<String> get titles => _titles;

  static List<String> get detailsPageUrls => _detailsPageUrls;

  static addItem(
    String posterUrl,
    String title,
    String detailsPageUrl,
  ) {
    _postersUrl.add(posterUrl);

    _titles.add(title);

    _detailsPageUrls.add(detailsPageUrl);
  }

  static resetData() {
    _postersUrl = [];

    _titles = [];

    _detailsPageUrls = [];
  }
}

class SelectedFilmData {}
