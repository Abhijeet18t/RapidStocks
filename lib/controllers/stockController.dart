import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/models/stockModel.dart';

class StockController extends GetxController {
  var data = StockModel().obs;
  void getData(String symbol) async {
    try {
      const IP_SERVER = '192.168.0.9';
      var response =
          await http.get('http://$IP_SERVER:3000/getData?company=$symbol');

      if (response.statusCode == 200) {
        data.value = stockModelFromJson(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
