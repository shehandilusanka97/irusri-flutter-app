import 'package:european_countries/screens/model/contries.dart';
import 'package:european_countries/service/country_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CountryNotifier extends ChangeNotifier {
  List<Contries> contries = [];
  bool? isLoading;
  String? errorMessage;

  CountryNotifier() {
    fetchContries();
  }

  fetchContries() async {
    try {
      isLoading = true;
      notifyListeners();

      contries = await CountryService.instance.getAllContries();

    } on DioError catch (e) {
      if (e.response != null) {
        errorMessage = 'Error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
    } catch (e) {
      errorMessage = 'Unexpected error occurred: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
