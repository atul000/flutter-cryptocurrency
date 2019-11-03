import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComlete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  CryptoRepository _repository;

  CryptoListPresenter(this._view) {
    _repository = new Injector().cryptoRepository;
  }
  void loadCurrencies() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComlete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
