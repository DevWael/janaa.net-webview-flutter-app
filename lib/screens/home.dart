import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:janastore/config.dart';
import 'package:janastore/CustomListTile.dart';
import 'dart:io';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = UniqueKey();
  WebViewController _webController;
  String _url = AppConfig.siteUrl;
  String _cart = AppConfig.cart;
  String _myAccount = AppConfig.myAccount;
  String _shop = AppConfig.shop;

  _openLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: goToHome,
          ),
//            IconButton(
//              icon: Icon(Icons.shop),
//              onPressed: go_to_shop,
//            ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: goToCart,
          ),
          IconButton(
            icon: Icon(Icons.supervisor_account),
            onPressed: goToMyAccount,
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
                        AppConfig.appTitle,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(FontAwesomeIcons.home, 'Home', () {
              Navigator.pop(context);
              goToHome();
            }),
            CustomListTile(FontAwesomeIcons.user, 'Profile', () {
              Navigator.pop(context);
              goToMyAccount();
            }),
            CustomListTile(FontAwesomeIcons.store, 'Shop', () {
              Navigator.pop(context);
              goToShop();
            }),
            CustomListTile(FontAwesomeIcons.shoppingBasket, 'Cart', () {
              Navigator.pop(context);
              goToCart();
            }),
            CustomListTile(FontAwesomeIcons.cog, 'Settings', () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/settings');
            }),
            CustomListTile(FontAwesomeIcons.exclamationCircle, 'Exit', () {
              exit(0);
            }),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            _openLink(AppConfig.facebook);
                          },
                          child: Icon(FontAwesomeIcons.facebookSquare,
                              color: hexToColor(AppConfig.facebookColor),
                              size: 30.0)),
                      InkWell(
                        onTap: () {
                          _openLink(AppConfig.whatsapp);
                        },
                        child: Icon(FontAwesomeIcons.whatsappSquare,
                            color: hexToColor(AppConfig.whatsAppColor),
                            size: 30.0),
                      ),
                      InkWell(
                          onTap: () {
                            _openLink(AppConfig.instagram);
                          },
                          child: Icon(FontAwesomeIcons.instagram,
                              color: hexToColor(AppConfig.instagramColor),
                              size: 30.0)),
                      InkWell(
                        onTap: () {
                          _openLink(AppConfig.youtube);
                        },
                        child: Icon(FontAwesomeIcons.youtubeSquare,
                            color: hexToColor(AppConfig.youtubeColor),
                            size: 30.0),
                      ),
                      InkWell(
                        onTap: () {
                          _openLink('https://maroof.sa');
                        },
                        child: Image.asset(
                          'images/maroof_logo.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        body: WebView(
          key: _key,
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
          userAgent: AppConfig.userAgent,
          onWebViewCreated: (WebViewController _tmpWebController) {
            _webController = _tmpWebController;
          },
        )
    );
  }

  void reloadPage() {
    _webController.reload();
  }

  void goToMyAccount() {
    //_webController.reload();
    _webController.loadUrl(_url + _myAccount);
  }

  void goToCart() {
    _webController.loadUrl(_url + _cart);
  }

  void goToShop() {
    _webController.loadUrl(_url + _shop);
  }

  void goToHome() {
    _webController.loadUrl(_url);
  }
}