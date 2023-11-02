import '../core/app_export.dart';
import 'exceptions.dart';
import 'logger.dart';
import 'network_info.dart';
import '../utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  var url = "https://userloginauth-vm0f.onrender.com/api/";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for https://userloginauth-vm0f.onrender.com/api/register
  ///
  /// Sends a GET request to the server's 'https://userloginauth-vm0f.onrender.com/api/register' endpoint
  /// Returns a [signUpRes] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<dynamic> signUp({
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        "${url}register",
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else {
        ProgressDialogUtils.hideProgressDialog();
        throw response.body ?? 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://userloginauth-vm0f.onrender.com/api/auth
  ///
  /// Sends a GET request to the server's 'https://userloginauth-vm0f.onrender.com/api/auth' endpoint
  /// Returns a [signInRes] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<dynamic> signIn({
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        "${url}auth",
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else {
        ProgressDialogUtils.hideProgressDialog();
        throw response.body ?? 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
