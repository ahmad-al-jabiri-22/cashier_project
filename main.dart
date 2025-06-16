import 'models/item.dart';
import 'models/batches.dart';
import 'models/debt.dart';
import 'system/system.dart';

void main() {
  final system = System();

  // ------------------ Add Items ------------------

  final sugar = Item(
    id: 1,
    name: 'Sugar',
    category: itemCategory.Food,
    quantity: 50,
    total_cost_price: 75.0,
    selling_price: 2.0,
    production_date: DateTime(2025, 1, 10),
    expiration_date: DateTime(2026, 1, 10),
  );

  final soap = Item(
    id: 2,
    name: 'Soap',
    category: itemCategory.Hygiene,
    quantity: 30,
    total_cost_price: 45.0,
    selling_price: 2.5,
    production_date: DateTime(2024, 12, 1),
    expiration_date: DateTime(2025, 9, 1),
  );

  final soda = Item(
    id: 3,
    name: 'Soda',
    category: itemCategory.Soda,
    quantity: 20,
    total_cost_price: 30.0,
    selling_price: 2.0,
    production_date: DateTime(2025, 4, 1),
    expiration_date: DateTime(2025, 7, 1),
  );

  system.add_Item(sugar);
  system.add_Item(soap);
  system.add_Item(soda);

  // ------------------ Add Batches ------------------

  system.addBatchToItem(1, Batches(
    quantity: 25,
    total_cost_price: 40.0,
    production_date: DateTime(2025, 2, 1),
    expiration_date: DateTime(2026, 2, 1),
  ));

  system.addBatchToItem(2, Batches(
    quantity: 15,
    total_cost_price: 20.0,
    production_date: DateTime(2025, 1, 1),
    expiration_date: DateTime(2025, 8, 1),
  ));

  // ------------------ Display All Items ------------------

  print("\n📦 All Items:");
  system.displayAllItems();

  // ------------------ Sell Items ------------------

  print("\n🛒 Selling Soda and Sugar...");
  system.sellItem(['Soda', 'Sugar'], 5.0);  // Expect: price = 4.0, change = 1.0

  // ------------------ Change Item Price ------------------

  print("\n💰 Changing price of Soap...");
  system.changeThePrice(2, 3.0);

  // ------------------ Search Item by Name ------------------

  print("\n🔍 Searching for 'Soap':");
  system.searchItemByName('Soap');

  // ------------------ Check Expired Items ------------------

  print("\n⏳ Checking Expiry:");
  system.checkExpiredItems();

  // ------------------ Add Debtors ------------------

  final customer1 = Debt(id: 1001, name: 'Alice', phoneNumber: '0912000000');
  final customer2 = Debt(id: 1002, name: 'Bob', phoneNumber: '0912555555');

  customer1.addPurchase(
    item: ['Sugar', 'Soda'],
    totalPrice: 5.0,
    paidAmount: 2.0,
  );

  customer2.addPurchase(
    item: ['Soap'],
    totalPrice: 3.0,
    paidAmount: 0.0,
  );

  system.add_debt_person(customer1);
  system.add_debt_person(customer2);

  // ------------------ Display All Debts ------------------

  print("\n💳 All Debts:");
  system.displayAllDebts();

  // ------------------ Pay Debt ------------------

  print("\n💵 Alice pays 1.5 more:");
  system.payDebt(1001, 1.5);

  // ------------------ Search Debt by Name ------------------

  print("\n🔎 Search for Bob's debt:");
  system.searchDebtByName('Bob');

  // ------------------ Delete Item ------------------

  print("\n🗑️ Deleting Soda item...");
  system.removeItemById(ItemID: 3);

  // ------------------ Delete Debt ------------------

  print("\n🧾 Deleting Alice's debt...");
  system.deleteDebtById(1001);

  // ------------------ Final Lists ------------------

  print("\n📋 Remaining Items:");
  system.displayAllItems();

  print("\n📋 Remaining Debts:");
  system.displayAllDebts();
}
