
import 'package:app_atak/modules/commons/lib/widgets/search_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchProvider Tests', () {
    test(
        'SearchProvider should perform search successfully with unknown title and link',
        () async {
      var searchProvider = SearchProvider();
      await searchProvider.search();

      expect(searchProvider.title, isNotNull);
      expect(searchProvider.link, isNotNull);

      print('Title: ${searchProvider.title}');
      print('Link: ${searchProvider.link}');
    });
  });
}
