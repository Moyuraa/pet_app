import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/developer_model.dart';
import 'package:final_project/pages/setting_screen.dart';
import 'package:final_project/services/developer_service.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Developers"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
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
          return _buildListView(snapshot.data);
        } else {
          return const CircularProgressIndicator(
            color: Colors.purpleAccent,
          );
        }
      },
    ));
  }

  Widget _buildListView(List<DevelopersModel>? users) {
    if (users == null) {
      return const Center(
        child: Icon(Icons.people_alt_rounded),
      );
    }

    return RefreshIndicator(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
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
    return Card(
      color: Colors.white,
      // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: SizedBox(
            width: 100,
            height: 300,
            child: CachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
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
          title: Center(
            child: Text(user.name),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),
              Text(user.phone),
              const SizedBox(height: 4.0),
              Text(user.email),
              const SizedBox(height: 4.0),
              Text(user.description),
            ],
          ),
        ),
      ),
    );
  }
}
