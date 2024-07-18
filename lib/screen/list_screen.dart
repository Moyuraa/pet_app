import 'package:flutter/material.dart';
import 'package:final_project/supporting/pet_card.dart';
import 'package:final_project/supporting/pet_data.dart';
import 'package:final_project/screen/pet_detail_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
 final List<PetData> pets = [
  ...dogsName.map((name) => PetData(
        imagePath: 'assets/images/${dogs[dogsName.indexOf(name)]}',
        name: name,
        date: '17 jun 2024',
        description: 'Friendly and playful dog.',
        isAdopted: false,
        location: 'New York',
      )),
  ...catsName.map((name) => PetData(
        imagePath: 'assets/images/${cats[catsName.indexOf(name)]}',
        name: name,
        date: '17 jun 2024',
        description: 'Cute and cuddly cat.',
        isAdopted: true,
        location: 'Los Angeles',
      )),
  ...bunniesName.map((name) => PetData(
        imagePath: 'assets/images/${bunnies[bunniesName.indexOf(name)]}',
        name: name,
        date: '17 jun 2024',
        description: 'Lovable bunny looking for a home.',
        isAdopted: false,
        location: 'Chicago',
      )),
  ...birdsName.map((name) => PetData(
        imagePath: 'assets/images/${birds[birdsName.indexOf(name)]}',
        name: name,
        date: '17 jun 2024',
        description: 'Colorful bird seeking a caring owner.',
        isAdopted: false,
        location: 'Miami',
      )),
];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredPets = pets
        .where(
            (pet) => pet.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Padding(
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: filteredPets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailPage(
                           
                          ),
                        ),
                      );
                    },
                    child: PetCard(
                      imagePath: filteredPets[index].imagePath,
                      petName: filteredPets[index].name,
                      date: filteredPets[index].date,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
