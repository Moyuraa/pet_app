import 'package:final_project/models/pet_model.dart';
import 'package:final_project/services/pet_service.dart';
import 'package:final_project/themes/language_constant.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/pet_card.dart';
import 'package:final_project/pages/pet_detail_screen.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Language _lang = Language();

  var _petData = PetService.getPets();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
        body: Center(
      child: FutureBuilder<List<PetsModel>>(
        future: _petData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "${snapshot.error}",
              style: const TextStyle(fontSize: 25),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    _lang.titleList,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: _lang.search,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(child: _buildGridView(snapshot.data))
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator(
              color: Colors.purpleAccent,
            );
          }
        },
      ),
    ));
  }

  Widget _buildGridView(List<PetsModel>? pets) {
    if (pets == null) {
      return const Center(
        child: Icon(Icons.pets),
      );
    }

    List<PetsModel> filteredPets = pets.where((pet) {
      if (searchQuery.isEmpty) {
        return true;
      }
      return pet.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          pet.introduction.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: filteredPets.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetDetailPage(
                  imageCoverURL: filteredPets[index].imageCoverUrl,
                  petName: filteredPets[index].name,
                  location: filteredPets[index].location,
                  age: filteredPets[index].age,
                  color: filteredPets[index].color,
                  weight: filteredPets[index].weight,
                  introduction: filteredPets[index].introduction,
                  imageDis1URL: filteredPets[index].imageDis1Url,
                  imageDis2URL: filteredPets[index].imageDis2Url,
                  imageDis3URL: filteredPets[index].imageDis3Url,
                ),
              ),
            );
          },
          child: _buildPet(filteredPets[index]),
        );
      },
    );
  }

  Widget _buildPet(PetsModel pet) {
    return PetCard(imageURL: pet.imageUrl, petName: pet.name, date: pet.date);
  }
}
