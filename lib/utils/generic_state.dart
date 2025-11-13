
class GenericState<T, D> {
  String? message;
  T? state;
  D? data;

  GenericState({
    this.message,
    this.state,
    this.data
  });
}