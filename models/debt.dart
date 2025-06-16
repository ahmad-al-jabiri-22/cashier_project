class Debt {
  int id;
  String name;
  String phoneNumber;
  List<Map<String, dynamic>> purchases_Dept = [];
  List<double> total_price_item =[];
  List<double> total_paid_amount =[];
  List<double> total_debt_amount =[];

  Debt({required this.id, required this.name, required this.phoneNumber});

  // Add a purchase to the debt list
  void addPurchase({
    required List<String> item,
    required double totalPrice,
    required double paidAmount,
  }) {
    purchases_Dept.add({
      "item": item,
      "totalPrice": totalPrice,
      "paidAmount": paidAmount,
      "date": DateTime.now(),
    });
    total_price_item.add(totalPrice);
    total_paid_amount.add(paidAmount);
    total_debt_amount.add(totalPrice - paidAmount);
  }

  double get  all_total_price_items  => total_price_item.fold(0, (p,e) => p + e );

  double get all_total_paid_amount => total_paid_amount.fold(0,(p,e) => p + e );
  
  double get all_total_debt_amount => total_debt_amount.fold(0,(p,e) => p + e );




  void displayInfo() {
    print("************ Debt Info for $name ***************");
    print("ID: $id");
    print("name: $name");
    print("Phone Number: $phoneNumber");
    print("all_total_price_items: $all_total_price_items");
    print("all_total_paid_amount: $all_total_paid_amount");
    print("all_total_debt_amount: $all_total_debt_amount");

    for (var purchase in purchases_Dept) {
      DateTime date = purchase["date"];
      String formattedDate =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} "
          "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

      print("Items: ${purchase['item'].join(', ')}");
      print("Total Price: \$${purchase['totalPrice']}");
      print("paid Amount: \$${purchase['paidAmount']}");
      print("Date: $formattedDate");
     print("------------------------------------------------");
    }
  }
}