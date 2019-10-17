import 'package:flutter/material.dart';
import 'package:janastore/config.dart';
import 'package:janastore/settings_module.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _settings = Settings();

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          actions: <Widget>[],
        ),
        body: Container(
          child: Builder(
              builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SwitchListTile(
                            title: Text('Arabic or English'),
                            value: _settings.isArabic,
                            onChanged: (bool val) {
                              _showSnackBar('Options Saved');
                              setState(() {
                                _settings.isArabic = val;
                              });
                            })
                      ],
                    ),
                  )
          ),
        )
    );
  }
}
