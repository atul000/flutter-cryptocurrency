import 'package:cryptocurrency/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", price_usd: "1111.11", percent_change_1h: "-9.9"),
  new Crypto(name: "Jio", price_usd: "1001.11", percent_change_1h: "-4.9"),
  new Crypto(name: "Airtel", price_usd: "1991.11", percent_change_1h: "-8.9")
];
