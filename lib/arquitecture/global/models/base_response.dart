part of arquitexture.global;

class BaseResponse<T> {
  final T? data;
  final String? error;
  final bool isError;
  BaseResponse({this.data, this.error, this.isError = false});

  static errorStr(String e) => BaseResponse(error: e, isError: true);
}
