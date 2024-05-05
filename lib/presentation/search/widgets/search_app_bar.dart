import 'dart:async';
import 'package:clubhub/core/extensions/string_extensions.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

// SearchAppBar widget, encapsulating the search functionality
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.onSearch,
    this.onClear,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final Function(String) onSearch;
  final VoidCallback? onClear;

  @override
  final Size preferredSize;

  @override
  SearchAppBarState createState() => SearchAppBarState();
}

class SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String inQuery) {
    String query = inQuery.trim();
    if (query.isEmpty) {
      query = '';
      widget.onClear?.call();
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (query.isNotEmpty) {
        widget.onSearch(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasySearchBar(
      title: Text(context.loc.search),
      onSearch: _onSearchChanged,
    );
  }
}
