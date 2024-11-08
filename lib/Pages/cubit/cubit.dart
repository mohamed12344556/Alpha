import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AppCubit extends Cubit<AppState> {
  int count = 0;
  List<Map<String, dynamic>> cart = [];
  int same = 0;
  int cartLength = 0;

  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  void navigateToMain() {
    emit(MainPageState());
  }

  void navigateToControl() {
    emit(ControlPageState());
  }

  void navigateToDetails() {
    emit(DetailsPageState());
  }

  void selectPage(int index) {
    if (index == 0) {
      emit(HomePageState());
    } else if (index == 1) {
      emit(FavoritePageState());
    } else if (index == 2) {
      emit(BagPageState());
    } else if (index == 3) {
      emit(NotifPageState());
    }
  }

  void selectPageNav(int index) {
    if (index == 0) {
      emit(cat1State());
    } else if (index == 1) {
      emit(cat2State());
    } else if (index == 2) {
      emit(cat3State());
    } else if (index == 3) {
      emit(cat4State());
    }
  }

  void AddProduct(int id) {
    // Check if the product is already in the cart
    bool productFound = false;

    for (int i = 0; i < cart.length; i++) {
      if (cart[i]['id'] == id) {
        print('same found');
        cart[i]['count'] += 1; // Increment the count for the existing product
        productFound = true; // Mark product as found
        break; // Exit the loop
      }
    }

    // If the product is not found, add it as a new product with count 1
    if (!productFound) {
      cart.add({'id': id, 'count': 1});
      print('new Added');
    }

    // Debugging output for cart items
    for (var item in cart) {
      print('Product ID: ${item['id']}, Count: ${item['count']}');
    }

    // Emit an updated state with the new cart
    cartLength = cart.length;
    print(cartLength);
    emit(CartUpdated(cart)); // Include count for better state management
  }

/*
  // Open the database
  Future<void> openDB() async {
    emit(DBLoading());

    try {
      database = await openDatabase(
        'App.db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              'CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT, imageUrl TEXT, name TEXT, discribtion TEXT, Rate REAL, price REAL, tag INTEGER)');
          print("Database created successfully!");
          emit(DBOpened());
        },
        onOpen: (db) {
          print("Database opened successfully!");
          emit(DBOpened());
        },
      );
    } catch (error) {
      print("Failed to open or create the database: ${error.toString()}");
      emit(DBError("Failed to open the database: ${error.toString()}"));
    }
  }

  // Insert data into the database
  Future<void> insertData({
    required int id,
    required String imageUrl,
    required String name,
    required String discribtion,
    required double Rate,
    required double price,
    required int tag,
  }) async {
    try {
      await database.transaction((App) async {
        await App.rawInsert(
            'INSERT INTO products(id, imageUrl, name, discribtion, Rate, price, tag) VALUES(?, ?, ?, ?, ?, ?, ?)',
            [imageUrl, name, discribtion, Rate, price, tag]);
      });
      print("Product added successfully!");
      emit(DBDataInserted("Data inserted successfully"));
    } catch (error) {
      print("Error while inserting data: ${error.toString()}");
      emit(DBError("Error while inserting data: ${error.toString()}"));
    }
  }

  // Fetch data from the database
  Future<void> fetchData() async {
    emit(DBLoading());
    try {
      List<Map<String, dynamic>> products =
          await database.rawQuery('SELECT * FROM products');
      emit(DBDataFetched(products));
    } catch (error) {
      emit(DBError("Error fetching data: ${error.toString()}"));
    }
  }*/
}
