import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/theme.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/customUrlText.dart';
import 'package:provider/provider.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? User();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(title: 'Settings', subtitle: 'and preferences'),
      body: ListView(
        children: <Widget>[
          HeaderWidget('Login and security'),
          SettingRowWidget(
            "Username",
            subtitle: user?.userName,
            // navigateTo: 'AccountSettingsPage',
          ),
          SettingRowWidget(
            "Email address",
            subtitle: user?.email,
            navigateTo: 'VerifyEmailPage',
          ),
          HeaderWidget('Signins', secondHeader: true,),
          SettingRowWidget(
            "Log out",
             textColor:TwitterColor.ceriseRed,
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/'));
                final state = Provider.of<AuthState>(context);
                state.logoutCallback();
             },
          ),
        ],
      ),
    );
  }
}
