import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hr_app/src/features/teams/team_detail.dart';
import 'package:hr_app/src/models/team.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(title: const Text('Team Management')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        // controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: 'Search team',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Color(0xFFACADAD),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (ResponsiveLayout.isDesktop(context)) const Spacer(),
                    if (ResponsiveLayout.isDesktop(context))
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Create team'))
                  ],
                ),
                const Gap(20),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: teams.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.4,
                      crossAxisCount:
                          ResponsiveLayout.isMobile(context) ? 2 : 4,
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
              ],
            ),
          ),
        ),
        floatingActionButton: (ResponsiveLayout.isMobile(context))
            ? FloatingActionButton(
                onPressed: () {}, child: const Icon(Icons.add))
            : null);
  }
}
