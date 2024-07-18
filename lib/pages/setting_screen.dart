import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:final_project/themes/fontsize_logic.dart';
import 'package:final_project/themes/language_constant.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:final_project/themes/mode_logic.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _langIndex = 0;
  Language _lang = Khmer();

  @override
  Widget build(BuildContext context) {
    _langIndex = context.watch<LanguageLogic>().langIndex;
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_lang.settings)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      children: [
        _buildListLanguages(),
        _buildListThemes(),
        _buildListFontSize(),
      ],
    );
  }

  Widget _buildListLanguages() {
    return ListView(physics: const BouncingScrollPhysics(), children: [
      ExpansionTile(
        title: Text(_lang.language),
        initiallyExpanded: true,
        children: [
          ListTile(
            leading: const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ខ្មែរ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            trailing: _langIndex == 0 ? Icon(Icons.check) : null,
            title: const Text("ភាសាខ្មែរ"),
            onTap: () {
              context.read<LanguageLogic>().changeToKhmer();
            },
          ),
          ListTile(
            leading: const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "EN",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            trailing: _langIndex == 1 ? Icon(Icons.check) : null,
            title: Text("English"),
            onTap: () {
              context.read<LanguageLogic>().changeToEnglish();
            },
          ),
        ],
      )
    ]);
  }

  Widget _buildListThemes() {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text(_lang.theme),
          initiallyExpanded: true,
          children: [
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: Text(_lang.toLightMode),
              onTap: () {
                context.read<ThemeLogic>().changeToLightMode();
              },
              trailing: themeIndex == 0 ? Icon(Icons.check) : null,
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: Text(_lang.toDarkMode),
              onTap: () {
                context.read<ThemeLogic>().changeToDarkMode();
              },
              trailing: themeIndex == 2 ? Icon(Icons.check) : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListFontSize() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text(_lang.fontSize),
          initiallyExpanded: true,
          trailing: Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<FontSizeLogic>().decrease();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  context.read<FontSizeLogic>().increase();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
