import 'package:flutter/material.dart';
import 'package:movies_app_pertemuan_5_assignment/data/models/movies_model.dart';
import 'package:movies_app_pertemuan_5_assignment/pages/components/card_banner_component.dart';

class ListCardBannerComponent extends StatelessWidget {
  const ListCardBannerComponent({super.key, required this.titleSection, required this.data});

  final String titleSection;
  final List<MoviesModel?> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Text(
                titleSection,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black.withAlpha(50),
                onTap: (){
                  
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Text("More", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CardBannerComponent(
                isFirstItem: index == 0,
                isLastItem: index + 1 == data.length ,
                urlBackgroundImage: data[index]?.url ?? "",
              );
            },
          ),
        )
      ],
    );
  }
}