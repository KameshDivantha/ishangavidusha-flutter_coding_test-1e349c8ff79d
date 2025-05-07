import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../services/search_service.dart';

// TODO: Implement SearchProvider using ChangeNotifier
// Requirements:
// - Create a class that extends ChangeNotifier
// - Use BehaviorSubject for search query stream
// - Apply rxdart operators (debounceTime, distinct, switchMap)
// - Handle potential errors gracefully
// - Emit states for Loading, Success, Error, and Empty

enum SearchState {
  initial,
  loading,
  success,
  error,
  empty,
}

class SearchProvider extends ChangeNotifier {
  final SearchService _searchService;
  final BehaviorSubject<String> _searchQueryStream = BehaviorSubject();
  
  SearchState _state = SearchState.initial;
  List<String> _results = [];
  String _errorMessage = '';

  SearchState get state => _state;
  List<String> get results => _results;
  String get errorMessage => _errorMessage;
  
  SearchProvider({SearchService? searchService}) 
      : _searchService = searchService ?? SearchService() {
    _searchQueryStream.stream
      .distinct()
      .debounceTime(const Duration(milliseconds: 300))
      .switchMap((query) {
        if (query.isEmpty) {
          _state = SearchState.initial;
          _results = [];
          notifyListeners();
          return Stream.value([]);
        }
        
        return Rx.fromCallable(() => _searchService.searchProducts(query))
          .doOnListen(() {
            _state = SearchState.loading;
            notifyListeners();
          })
          .map((products) {
            if (products.isEmpty) {
              _state = SearchState.empty;
            } else {
              _state = SearchState.success;
            }
            _results = products;
            notifyListeners();
            return products;
          })
          .onErrorReturnWith((error, _) {
            _state = SearchState.error;
            _errorMessage = error.toString();
            notifyListeners();
            return [];
          });
      })
      .listen((_) {});
  }

  void search(String query) {
    _searchQueryStream.add(query);
  }

  void clear() {
    _searchQueryStream.add('');
    _state = SearchState.initial;
    _results = [];
    _errorMessage = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _searchQueryStream.close();
    super.dispose();
  }
}
