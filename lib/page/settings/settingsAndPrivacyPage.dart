import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/theme.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/customUrlText.dart';
import 'package:provider/provider.dart';
import 'widgets/settingsRowWidget.dart';

class SettingsAndPrivacyPage extends StatelessWidget {
  const SettingsAndPrivacyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? User();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(

        isBackButton: true,
        title: customTitleText(
          'Settings and privacy',
        ),
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget('Account settings'),
          SettingRowWidget(
            "Account",
            navigateTo: 'AccountSettingsPage',
          ),
          HeaderWidget(
            'General',
            secondHeader: true,
          ),
          SettingRowWidget(
            "About Bubbl",
            navigateTo: "AboutPage",
          ),
          SettingRowWidget(
            null,
            showDivider: false,
            vPadding: 10,
            subtitle:
                'These settings affect all of your Bubbl accounts on this device.',
          )
        ],
      ),
    );
  }
}
