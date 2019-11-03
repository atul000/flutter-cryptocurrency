import 'package:cryptocurrency/data/crypto_data.dart';
import 'package:cryptocurrency/modules/crypto_presenter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cyptocurrency"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: _currencies == null ? 0 : _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Crypto currency = _currencies[index];
              final MaterialColor color = _colors[index % _colors.length];

              return _getListItemUi(currency, color);
            },
          ),
        ),
      ],
    ));
  }

  ListTile _getListItemUi(Crypto currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency.name[0]),
      ),
      title: new Text(
        currency.name,
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:
          _getSubtitleText(currency.price_usd, currency.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
      text:
          new TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }

  @override
  void onLoadCryptoComlete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComlete
    setState(() {
      _currencies = items;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
