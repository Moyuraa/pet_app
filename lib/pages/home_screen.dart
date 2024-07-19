import 'package:final_project/themes/fontsize_logic.dart';
import 'package:final_project/themes/language_constant.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:final_project/themes/mode_logic.dart';
import 'package:flutter/material.dart';
import 'package:final_project/style/app_styles.dart';
import 'package:final_project/style/size_config.dart';
import 'package:final_project/widgets/pet_data.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _themeIndex = 0;
  int _langIndex = 0;
  Language _lang = Language();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/welcome_message.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: SizeConfig.blockSizeHorizontal! * 38,
                top: 0,
                bottom: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'NaRaPet',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '👋',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Ready for an amazing and lucky',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'experience 🐈 🐕 🐇 🐦',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildPetSection('Dogs', '🐕', dogs, dogsName, dogsDate),
        const SizedBox(height: 30),
        _buildPetSection('Cats', '🐈', cats, catsName, catsDate),
        const SizedBox(height: 30),
        _buildPetSection('Bunnies', '🐇', bunnies, bunniesName, bunniesDate),
        const SizedBox(height: 30),
        _buildPetSection('Birds', '🐦', birds, birdsName, birdsDate),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(Icons.pets),
          ),
          ExpansionTile(
            title: Text(
              _lang.theme,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            initiallyExpanded: false,
            children: [
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: Text(_lang.toLightMode),
                onTap: () {
                  context.read<ThemeLogic>().changeToLightMode();
                },
                trailing: _themeIndex == 0 ? const Icon(Icons.check) : null,
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(_lang.toDarkMode),
                onTap: () {
                  context.read<ThemeLogic>().changeToDarkMode();
                },
                trailing: _themeIndex == 1 ? const Icon(Icons.check) : null,
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              _lang.language,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            initiallyExpanded: false,
            children: [
              ListTile(
                leading: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      _lang.kh,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                trailing: _langIndex == 0 ? const Icon(Icons.check) : null,
                title: Text(_lang.khmer),
                onTap: () {
                  context.read<LanguageLogic>().changeToKhmer();
                },
              ),
              ListTile(
                leading: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      _lang.en,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                trailing: _langIndex == 1 ? const Icon(Icons.check) : null,
                title: Text(_lang.english),
                onTap: () {
                  context.read<LanguageLogic>().changeToEnglish();
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              _lang.fontSize,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            initiallyExpanded: false,
            children: [
              ListTile(
                leading: const Icon(Icons.remove),
                title: Text(_lang.smallerSize),
                onTap: () {
                  context.read<FontSizeLogic>().decrease();
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: Text(_lang.biggerSize),
                onTap: () {
                  context.read<FontSizeLogic>().increase();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPetSection(String title, String emoji, List<String> images,
      List<String> names, List<String> dates) {
    return Column(
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(width: 10),
              Text(
                emoji,
                style: Theme.of(context).textTheme.headlineMedium,
                // style: TextStyle(
                //   fontFamily: 'SourceSansPro',
                //   fontWeight: FontWeight.w700,
                //   fontSize: SizeConfig.blockSizeHorizontal! * 3,
                // ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 169,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 169,
                width: 150,
                margin: EdgeInsets.only(
                  left: index == 0 ? 30 : 15,
                  right: index == images.length - 1 ? 30 : 0,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusList),
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      offset: const Offset(0, 3),
                      color: kBoxShadowColor.withOpacity(0.18),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadiusList),
                        child: Image.asset(
                          'assets/images/${images[index]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical! * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5),
                            color: kLightOrange,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Center(
                            child: Text(
                              'Adoption',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.favorite_outline,
                          color: kRed,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          names[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          dates[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
