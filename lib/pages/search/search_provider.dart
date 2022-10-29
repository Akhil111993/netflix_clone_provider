import 'package:flutter/foundation.dart';

import 'package:netflix_clone/network/base_client.dart';

import '../../models/Search/search_response.dart';

class SearchProvider extends ChangeNotifier {
  SearchResponseModel? _searchResponseModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  SearchResponseModel? get searchResponseModel => _searchResponseModel;

  void callApi(String endPoint) async {
    _isLoading = true;
    var responseString = await BaseClient.get(endPoint);
    _isLoading = false;
    if (responseString == null) {
      return;
    } else {
      _searchResponseModel = searchResponseModelFromJson(responseString);
    }
    notifyListeners();
  }
}
