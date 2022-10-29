import 'package:flutter/foundation.dart';

import 'package:netflix_clone/network/base_client.dart';

import '../../models/hot&new/coming_soon_response_model.dart';

class ComingSoonProvider extends ChangeNotifier {
  ComingSoonResponseModel? _comingSoonResponseModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  ComingSoonResponseModel? get comingSoonResponseModel =>
      _comingSoonResponseModel;

  void callApi(String endPoint) async {
    _isLoading = true;
    var responseString = await BaseClient.get(endPoint);
    _isLoading = false;
    if (responseString == null) {
      return;
    } else {
      _comingSoonResponseModel =
          comingSoonResponseModelFromJson(responseString);
    }
    notifyListeners();
  }
}
