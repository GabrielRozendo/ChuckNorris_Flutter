import 'package:path/path.dart' as p;

enum MockFiles {
  BadSearch,
  Categories,
  SentenceBiggerThan80,
  SentenceSmallerThan80,
  SingleCategorized,
  SingleMultiCategorized,
  SingleNoCategorized,
  SearchFace,
  SearchNoResult,
}

extension MockFilesExtension on MockFiles {
  String combinePath(String file) => p.join('mocks', 'json', file);

  String get fileName {
    switch (this) {
      case MockFiles.BadSearch:
        return combinePath('bad_search.json');
      case MockFiles.Categories:
        return combinePath('categories.json');
      case MockFiles.SentenceBiggerThan80:
      case MockFiles.SingleCategorized:
        return combinePath('categorized.json');
      case MockFiles.SentenceSmallerThan80:
      case MockFiles.SingleMultiCategorized:
        return combinePath('multiple_categories.json');
      case MockFiles.SingleNoCategorized:
        return combinePath('no_category.json');
      case MockFiles.SearchFace:
        return combinePath('search_face.json');
      case MockFiles.SearchNoResult:
        return combinePath('search_noresult.json');

      default:
        return null;
    }
  }
}
