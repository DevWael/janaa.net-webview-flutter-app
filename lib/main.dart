import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyA
pp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Jana'),
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
//            IconButton(
//              icon: Icon(Icons.shop),
//              onPressed: go_to_shop,
//            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: go_to_cart,
            ),
            IconButton(
              icon: Icon(Icons.supervisor_account),
              onPressed: go_to_myaccount,
            ),
//            IconButton(
//              icon: Icon(Icons.refresh),
//              onPressed: reload_page,
//            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.green,
                  Colors.lightGreenAccent,
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Image.asset(
                            'images/logo.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Jana Store',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomListTile(Icons.person, 'profile', () => {}),
              CustomListTile(Icons.person, 'profile', () => {}),
              CustomListTile(Icons.person, 'profile', () => {}),
              CustomListTile(Icons.person, 'profile', () => {}),
              CustomListTile(Icons.person, 'profile', () => {}),
            ],
          ),
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

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: InkWell(
          splashColor: Colors.lightGreenAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
