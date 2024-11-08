abstract class AppState {}

class AppInitial extends AppState {}

class HomePageState extends AppState {}

class FavoritePageState extends AppState {}

class BagPageState extends AppState {}

class NotifPageState extends AppState {}

class AppInitialState extends AppState {}

class MainPageState extends AppState {}

class DetailsPageState extends AppState {}

class ControlPageState extends AppState {}

class cat1State extends AppState {}

class cat2State extends AppState {}

class cat3State extends AppState {}

class cat4State extends AppState {}

class pADDState extends AppState {}

class CartUpdated extends AppState {
  final List<Map<String, dynamic>> cart;

  CartUpdated(this.cart);
}

class CounterInitial extends AppState {
  final int count;

  CounterInitial(this.count);
}

class CounterUpdated extends AppState {}

/*
class DBLoading extends AppState {}

class DBOpened extends AppState {}

class DBError extends AppState {
  final String message;
  DBError(this.message);
}

class DBDataInserted extends AppState {
  final String message;
  DBDataInserted(this.message);
}

class DBDataFetched extends AppState {
  final List<Map<String, dynamic>> products;
  DBDataFetched(this.products);
}*/
