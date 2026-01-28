
sealed class CartsListState {}
class CartsListInitialState extends CartsListState{}
class CartsListLoadedState extends CartsListState{}
class CartsListFailedState extends CartsListState{}
class CartsListLoadingState extends CartsListState{}
class CartsListEmptyState extends CartsListState{}