abstract class RequestState {}

class RequestInit extends RequestState {}

class RequestLoading extends RequestState {
  RequestLoading();
}

class RequestLoaded extends RequestState {
  final dynamic? date;

  RequestLoaded({this.date});
}

class RequestError extends RequestState {}
