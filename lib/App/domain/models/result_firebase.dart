class Result<T> {
  final T item;

  bool get success => item != null;

  final String errorMessage;

  Result({this.item, this.errorMessage});
}

class VoidResult {
  bool get success => errorMessage == null;

  final String errorMessage;
  final String userId;

  VoidResult({this.errorMessage, this.userId});
}
