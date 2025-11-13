import 'package:flutter/material.dart';
import 'package:rest_well_aurant/pages/restaurant_detail_page.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';

class ItemRestaurantComponent extends StatelessWidget {
  final String id;
  final String idImage;
  final String titleRestaurant;
  final String cityRestaurant;
  final double rating;
  final String description;
  final Function()? detailOnTap;
  const ItemRestaurantComponent({
    super.key,
    required this.id,
    required this.idImage,
    required this.titleRestaurant,
    required this.cityRestaurant,
    required this.rating,
    required this.description,
    required this.detailOnTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                child: Hero(
                  tag: id,
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/$idImage", 
                    fit: BoxFit.cover,
                  ),
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                titleRestaurant, 
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      "Kota",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ": $cityRestaurant",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      "Rating",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ": ${rating.toString()}",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      "Deskripsi",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 16.0,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: ColorsUtil.primaryColor),
                borderRadius: BorderRadius.circular(8.0),
                color: ColorsUtil.secondaryColor
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: detailOnTap,
                  borderRadius: BorderRadius.circular(8.0),
                  splashColor: ColorsUtil.primaryColor.withAlpha(200),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        "Detail",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
          ],
        ),
      ),
    );
  }
}