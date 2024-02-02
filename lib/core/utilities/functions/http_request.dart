import '../../services/dio.dart';
import '../enums.dart';
import '../singleton.dart';

Future httpRequest({
  required HttpRequestType httpRequestType,
  required String path,
  dynamic payload,
}) async {
  switch (httpRequestType) {
    case HttpRequestType.get:
      return locator<DioService>().dio.get(path);
    case HttpRequestType.post:
      return locator<DioService>().dio.post(path, data: payload);
    case HttpRequestType.put:
      return locator<DioService>().dio.put(path, data: payload);
    case HttpRequestType.delete:
      return locator<DioService>().dio.delete(path, data: payload);
  }
}

cancelApiRequests() {
  locator<DioService>().cancelToken.cancel();
}
