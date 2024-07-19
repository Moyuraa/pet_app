import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/themes/language_constant.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/developer_model.dart';
import 'package:final_project/services/developer_service.dart';
import 'package:provider/provider.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  Language _lang = Language();

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _lang.developer,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: _buildBody(),
    );
  }

  var _developerData = DeveloperService.getDevelopers();

  Widget _buildBody() {
    return Center(
        child: FutureBuilder<List<DevelopersModel>>(
      future: _developerData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            style: const TextStyle(fontSize: 25),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _buildPageView(snapshot.data);
        } else {
          return const CircularProgressIndicator(
            color: Colors.purpleAccent,
          );
        }
      },
    ));
  }

  Widget _buildPageView(List<DevelopersModel>? users) {
    if (users == null) {
      return const Center(
        child: Icon(Icons.people_alt_rounded),
      );
    }

    return RefreshIndicator(
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: users.length,
          itemBuilder: (context, index) {
            return _buildUser(users[index]);
          },
        ),
        onRefresh: () async {
          setState(() {
            _developerData = DeveloperService.getDevelopers();
          });
        });
  }

  Widget _buildUser(DevelopersModel user) {
    return Center(
      child: Container(
          width: 300,
          height: 400,
          child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: user.profileUrl,
                        placeholder: (context, url) => Container(
                          color: Colors.white,
                        ),
                        errorWidget: (context, url, error) => Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    user.phone,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ))),
    );
  }
}
