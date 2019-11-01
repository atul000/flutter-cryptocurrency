import 'dart:convert';

import 'package:cryptocurrency/data/crypto_data.dart';

import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CryptoRepository {
  String currUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(currUrl);
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error occured : [Status Code : $statusCode]");
    }
  }
}
