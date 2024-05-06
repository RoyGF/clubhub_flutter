import 'package:clubhub/presentation/search/widgets/search_app_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchAppBar calls onSearch after debounce',
      (WidgetTester tester) async {
    String searchedText = '';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: SearchAppBar(
          title: "Search",
          onSearch: (query) {
            searchedText = query;
          },
        ),
      ),
    ));

    await tester.enterText(find.byType(EasySearchBar), 'Roy');
    await tester.pump(const Duration(milliseconds: 1000));

    expect(searchedText, 'Roy');
  });

  testWidgets('SearchAppBar trims text before calling onSearch',
      (WidgetTester tester) async {
    String searchedText = '';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: SearchAppBar(
          title: "Search",
          onSearch: (query) {
            searchedText = query;
          },
        ),
      ),
    ));

    await tester.enterText(find.byType(EasySearchBar), '           Roy     ');
    await tester.pump(const Duration(milliseconds: 1000));

    expect(searchedText, 'Roy');
  });
}
