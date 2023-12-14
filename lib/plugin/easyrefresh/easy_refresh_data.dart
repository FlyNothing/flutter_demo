const int _max = 32;

List<Map<String, String>> getPageData(int page, int size) {
  if (_max < page * size) {
    size = _max - (page - 1) * size;
  }

  return List.generate(
    size,
    (index) => {
      "leading": "leading-${index + 1 + (page - 1) * 10}",
      "title": "title-${index + 1 + (page - 1) * 10}",
      "trailing": "trailing-${index + 1 + (page - 1) * 10}"
    },
  );
}
