import 'package:flutter/foundation.dart';
import 'package:netflix_clone/models/Downloads/downloads_response_model.dart';
import 'package:netflix_clone/network/base_client.dart';

class DownloadsProvider extends ChangeNotifier {
  DownloadsResponseModel? _downloadsResponseModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  DownloadsResponseModel? get downloadsResponseModel => _downloadsResponseModel;

  void callApi(String endPoint) async {
    if (_downloadsResponseModel == null) {
      _isLoading = true;
      var responseString = await BaseClient.get(endPoint);
      _isLoading = false;
      if (responseString == null) {
        return;
      } else {
        _downloadsResponseModel =
            downloadsResponseModelFromJson(responseString);
      }
      notifyListeners();
    }
  }
}
