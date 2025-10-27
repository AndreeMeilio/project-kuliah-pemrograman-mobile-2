import 'package:flutter/material.dart';

class CardBannerComponent extends StatelessWidget {
  const CardBannerComponent({
    super.key, 
    required this.urlBackgroundImage,
    required this.isFirstItem,
    required this.isLastItem});
  
  final String urlBackgroundImage;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isFirstItem ? 16.0 : 4.0,
        right: isLastItem ? 16.0 : 4.0
      ),
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.35,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.white38),
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(image: AssetImage(urlBackgroundImage), fit: BoxFit.cover)
      ),
    );
  }
}