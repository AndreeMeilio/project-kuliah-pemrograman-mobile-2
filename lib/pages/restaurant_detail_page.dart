
import 'package:flutter/material.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';

class RestaurantDetailPage extends StatefulWidget {
  RestaurantDetailPage({super.key, required this.data});

  Restaurant data;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Detail Restaurant",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: widget.data.id ?? "",
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/${widget.data.pictureId}", 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}