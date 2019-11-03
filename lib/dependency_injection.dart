import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/data/crypto_data_mock.dart';
import 'package:cryptocurrency/data/crypto_data_prod.dart';

enum Flavour { MOCK, PROD }

// Dependency injection
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavour _flavour; // _ => private

  static void configure(Flavour flavour) {
    _flavour = flavour;
  }

  factory Injector() {
    return _singleton;
  }
  Injector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavour) {
      case Flavour.MOCK:
        return MockCryptoRepository();
      default:
        return new ProdCryptoRepository();
    }
  }

  Injector _internal() {}
}
