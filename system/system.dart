import '../models/batches.dart';
import '../models/debt.dart';
import '../models/item.dart';

class System {
  List<Debt> debt_person = [];
  List<Item> all_Items = [];

  void add_Item(Item item) {
    all_Items.add(item);
    print("The ${item.name} Item has been added successfully");
  }

  void removeItemById({required int ItemID}) {
    final itme = all_Items.firstWhere(
      (i) => i.id == ItemID,
      orElse: () => throw Exception("The id $ItemID didn't exist"),
    );
    all_Items.remove(itme);
  }

  void searchItemByName(String name) {
    final item = all_Items.firstWhere(
      (i) => i.name == name,
      orElse: () => throw Exception("The name $name didn't exist"),
    );
    item.displayInfo();
  }

  void displayAllItems() {
    for (var item in all_Items) {
      item.displayInfo();
    }
  }

  void addBatchToItem(int itemId, Batches batch) {
    final item = all_Items.firstWhere(
      (i) => i.id == itemId,
      orElse: () => throw Exception("The id $itemId didn't exist"),
    );
    item.addBatch(batch);
  }

  void checkExpiredItems() {
    for (var itme in all_Items) {
      itme.expired_After();
    }
  }

  void add_debt_person(Debt debt) {
    debt_person.add(debt);
    print("The ${debt.name} Item has been added successfully");
  }

  void changeThePrice(int ItemID, double newSellingPrice) {
    final oneItem = all_Items.firstWhere(
      (i) => i.id == ItemID,
      orElse: () => throw Exception("The id $ItemID didn't exist  "),
    );
    print(
      "the item ${oneItem.name} has been changed his selling price from \$${oneItem.selling_price} to \$${newSellingPrice}",
    );
    oneItem.selling_price = newSellingPrice;
  }

  void displayAllDebts() {
    for (var debt in debt_person) {
      debt.displayInfo();
    }
  }

  void sellItem(List<String> names, double paidAmount) {
    
    double price = 0;
    for (var One_item in names) {
      final item = all_Items.firstWhere(
        (i) => i.name == One_item,
        orElse: () => throw Exception("this item $One_item didn't exist"),
      );
      item.quantity -= 1;
      price += item.selling_price;
      print(item.quantity);
    }
    print("price $price");
    print("paid amount $paidAmount");
    print("Change ${paidAmount - price}");
  }

  void deleteDebtById(int id) {
    final debt = debt_person.firstWhere(
      (i) => i.id == id,
      orElse: () => throw Exception("The id $id didn't exist"),
    );
    debt_person.remove(debt);
  }

  void searchDebtByName(String name) {
    final debt = debt_person.firstWhere(
      (i) => i.name == name,
      orElse: () => throw Exception("The name $name didn't exist"),
    );
    debt.displayInfo();
  }

  void payDebt(int debtId, double amount) {
    final debt = debt_person.firstWhere(
      (i) => i.id == debtId,
      orElse: () => throw Exception("The id $debtId didn't exist"),
    );
    debt.total_paid_amount.add(amount);
  }
}
