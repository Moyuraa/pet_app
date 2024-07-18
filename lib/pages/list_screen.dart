import 'package:final_project/models/pet_model.dart';
import 'package:final_project/services/pet_service.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/pet_card.dart';
import 'package:final_project/pages/pet_detail_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var _petData = PetService.getPets();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'Pet List',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search pets',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
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

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: pets.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetDetailPage(
                  imageCoverURL: pets[index].imageCoverUrl,
                  petName: pets[index].name,
                  location: pets[index].location,
                  age: pets[index].age,
                  color: pets[index].color,
                  weight: pets[index].weight,
                  introduction: pets[index].introduction,
                  imageDis1URL: pets[index].imageDis1Url,
                  imageDis2URL: pets[index].imageDis2Url,
                  imageDis3URL: pets[index].imageDis3Url,
                ),
              ),
            );
          },
          child: _buildPet(pets[index]),
        );
      },
    );
  }

  Widget _buildPet(PetsModel pet) {
    return PetCard(imageURL: pet.imageUrl, petName: pet.name, date: pet.date);
  }
}
