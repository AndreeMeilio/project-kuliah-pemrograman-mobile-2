
import 'package:flutter/material.dart';
import 'package:movies_app_pertemuan_5_assignment/data/models/movies_model.dart';

class NowPlayingCardBannerComponent extends StatelessWidget {
  const NowPlayingCardBannerComponent({
    this.data,
    super.key
  });

  final MoviesModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        image: (data?.url?.isNotEmpty ?? false) ? DecorationImage(image: AssetImage(data!.url!), fit: BoxFit.cover) : null,
        borderRadius: BorderRadius.circular(16.0),
        // border: Border.all(color: Colors.black)
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 8.0,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(125)
              ),
              child: Text(
                data?.title ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(125)
              ),
              height: 25,
              width: double.infinity,
              child: Row(
                spacing: 8.0,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data?.year ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: (data?.genre != null) ? data!.genre!.map<Widget>((data){
                          return Text(
                            "$data ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                            ),
                          );
                        }).toList() : []
                      ),
                    )
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(125)
              ),
              child: Text(
                data?.sinopsis ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ),
    );
  }
}