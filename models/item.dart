import 'batches.dart';

enum itemCategory { Food, Snacks, Hygiene, Ice_cream, Soda }

class Item {
  int id;
  String name;
  double total_cost_price;
  double? piece_cost_price;
  double selling_price;
  int quantity;
  itemCategory category;
  DateTime production_date;
  DateTime expiration_date;
  double? profit_from_piece;
  double? profit_from_total_quantity;

  List<Batches> batches = [];

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.total_cost_price,
    required this.selling_price,
    required this.production_date,
    required this.expiration_date,
  }) {
    // <- THIS IS CALLED THE "CONSTRUCTOR BODY"
    piece_cost_price = quantity != 0 ? total_cost_price / quantity : 0;
    profit_from_piece = selling_price - piece_cost_price!;
    profit_from_total_quantity = profit_from_piece! * quantity;
  }

  bool get isExpired => DateTime.now().isAfter(expiration_date);

  void expired_After() {
    if (!isExpired) {
      DateTime now = DateTime.now();
      int years = expiration_date.year - now.year;
      int months = expiration_date.month - now.month;
      int days = expiration_date.day - now.day;

      if (days < 0) {
        months -= 1;
        final lastMonth = DateTime(now.year, now.month + 1, 0);
        days += lastMonth.day;
      }
      if (months < 0) {
        years -= 1;
        months += 12;
      }
      print("This item will expire after:");
      print("Years: $years");
      print("Months: $months");
      print("Days: $days");
      int daysLeft = expiration_date.difference(now).inDays;
      print("This item will expire after: $daysLeft days.");
    } else {
      print("this item is expired");
    }
  }

  // Add a batch of beans or any item batch
  void addBatch(Batches batch) {
    batches.add(batch);
  }

  // Calculate total quantity across all batches
  int get total_quantity_from_batches =>
      batches.fold(0, (sum, batch) => sum + batch.quantity);



  

  int get total_Quantity_with_batches => total_quantity_from_batches + quantity;

  // Calculate total cost price across all batches
  double get total_cost_price_for_batches =>
      batches.fold(0, (sum, batch) => sum + batch.total_cost_price );

  double get total_cost_price_with_batches => total_cost_price + total_cost_price_for_batches;


  void displayBatchesInfo() {
    print("********** (display batch Info of ${name} item) ***********");
    for (var b in batches) {
      print("Batch total cost price: ${b.total_cost_price.toStringAsFixed(3)}");
      print("Batch quantity: ${b.quantity}");
      print("production date: ${b.production_date.toIso8601String().split("T")[0]}");
      print("expiration date: ${b.expiration_date.toIso8601String().split("T")[0]}");
    }

    print("Total Quantity for all batches: $total_quantity_from_batches");
    print("Total Quantity with batches: $total_Quantity_with_batches");
    print("total cost price for all batches: $total_cost_price_for_batches");
    print("total cost price with batches: $total_cost_price_with_batches");
    print("******************************************************");
  }

  void displayInfo() {
    print("********** (display Info ${name} item) ***********");
    print("ID: ${id}");
    print("Name: ${name}");
    print("cost price: ${total_cost_price}");
    print("cost piece price: ${piece_cost_price?.toStringAsFixed(3)}");
    print("selling price: ${selling_price}");
    print("item Category: ${category.name.replaceAll("_", " ")}");
    print("quantity: ${quantity}");
    print(
      "production date: ${production_date.toIso8601String().split("T")[0]}",
    );
    print(
      "expiration date: ${expiration_date.toIso8601String().split("T")[0]}",
    );
    print("profit for one piece: ${profit_from_piece?.toStringAsFixed(3)}");
    print("total profit: ${profit_from_total_quantity?.toStringAsFixed(3)}");
    expired_After();
    print("******************************************************");
  }
}
