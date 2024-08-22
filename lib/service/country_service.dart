import 'package:dio/dio.dart';
import 'package:european_countries/screens/config.dart';
import 'package:european_countries/model/contries.dart';

class CountryService {
  static final CountryService _instance = CountryService();
  static CountryService get instance => _instance;
  List<Contries> contries = [];
  final Dio dio = Dio();

 Future<List<Contries>> getAllContries() async {
    final response = await dio.get(Config.API_URL);

    if (response.statusCode == 200) {
      List<Contries> data = Contries.listFromJson(response.data);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

}
