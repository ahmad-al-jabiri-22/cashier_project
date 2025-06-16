class Batches{
int quantity;
DateTime production_date;
DateTime expiration_date;
double total_cost_price;


  Batches({required this.quantity,
  required this.total_cost_price,
  required this.production_date,
  required this.expiration_date});

  double get piece_cost_price => quantity != 0 ? total_cost_price / quantity :0;  

}