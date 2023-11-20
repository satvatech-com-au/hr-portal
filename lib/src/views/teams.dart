import 'package:flutter/material.dart';
import 'package:hr_app/src/models/team.dart';
import 'package:hr_app/src/views/team_detail.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: const Text('Team Management')),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GridView.builder(
            itemCount: teams.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.4,
                crossAxisCount: screenWidth < 550 ? 2 : 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeamInfoScreen()));
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/team.png',
                        height: 60,
                      ),
                      Text(teams[index].name),
                      Text('${teams[index].numberOfMembers} members')
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
