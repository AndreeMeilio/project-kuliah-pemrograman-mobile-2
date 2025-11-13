
import 'package:flutter/material.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.sizeOf(context).width * 0.35,
              width: MediaQuery.sizeOf(context).width * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                child: Image.asset("assets/profile.png", fit: BoxFit.cover, ),
              )
            ),
            const SizedBox(height: 16.0,),
            Text(
              "Andree Meilio Caniago",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "TIF RM 23B",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "23552011016",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Pemrograman Mobile 2",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}