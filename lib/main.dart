import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'JanaStore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = UniqueKey();
  WebViewController _webController;
  String _url = 'https://janaa.net/';
  String _cart = 'cart';
  String _my_account = 'my-account';
  String _shop = 'shop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: go_to_home,
            ),
            IconButton(
              icon: Icon(Icons.shop),
              onPressed: go_to_shop,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: go_to_cart,
            ),
            IconButton(
              icon: Icon(Icons.supervisor_account),
              onPressed: go_to_myaccount,
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: reload_page,
            ),
          ],
        ),
        body: WebView(
          key: _key,
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController _tmpWebController) {
            _webController = _tmpWebController;
          },
        ));
  }

  void reload_page() {
    _webController.reload();
  }

  void go_to_myaccount() {
    //_webController.reload();
    _webController.loadUrl(_url + _my_account);
  }

  void go_to_cart() {
    _webController.loadUrl(_url + _cart);
  }

  void go_to_shop() {
    _webController.loadUrl(_url + _shop);
  }

  void go_to_home() {
    _webController.loadUrl(_url);
  }
}
