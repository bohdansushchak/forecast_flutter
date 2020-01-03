class HttpError extends Error {
  final int code;
  final String message;

  HttpError({this.code, this.message});
}
