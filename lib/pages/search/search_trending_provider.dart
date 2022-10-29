import 'package:flutter/foundation.dart';

import 'package:netflix_clone/network/base_client.dart';

import '../../models/Search/search_trending_response.dart';

class SearchTrendingProvider extends ChangeNotifier {
  SearchTrendingResponseModel? _searchTrendingResponseModel;
  bool _isLoading = true;
  bool _isTextEmpty = true;

  bool get isLoading => _isLoading;
  bool get isTextEmpty => _isTextEmpty;

  SearchTrendingResponseModel? get searchTrendingResponseModel =>
      _searchTrendingResponseModel;

  void setIsTextEmpty(bool isTextEmpty) {
    _isTextEmpty = isTextEmpty;
    notifyListeners();
  }

  void callApi(String endPoint) async {
    if (_searchTrendingResponseModel == null) {
      _isLoading = true;
      var responseString = await BaseClient.get(endPoint);
      _isLoading = false;
      if (responseString == null) {
        return;
      } else {
        _searchTrendingResponseModel =
            searchTrendingResponseModelFromJson(responseString);
      }
      notifyListeners();
    }
  }
}
