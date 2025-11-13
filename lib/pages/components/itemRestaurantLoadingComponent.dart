import 'package:flutter/material.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemRestaurantComponentLoading extends StatelessWidget {
  
  const ItemRestaurantComponentLoading({
    super.key,
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
            Shimmer(
              duration: Duration(seconds: 1),
              color: Colors.white, //Default value
              colorOpacity: 0.3, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLeftToRight(),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  child: Container(
                    color: Colors.grey,
                  )
                )
              ),
            ),
            Shimmer(
              duration: Duration(seconds: 1),
              color: Colors.white, //Default value
              colorOpacity: 0.3, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLeftToRight(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 20,
                  color: Colors.grey,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Shimmer(
                    duration: Duration(seconds: 1),
                    color: Colors.white, //Default value
                    colorOpacity: 0.3, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLeftToRight(),
                    child: SizedBox(
                      width: 100.0,
                      child: Container(
                        height: 20,
                        color: Colors.grey,
                      )
                    ),
                  ),
                  const SizedBox(width: 8.0,),
                  Expanded(
                    flex: 2,
                    child: Shimmer(
                      duration: Duration(seconds: 1),
                      color: Colors.white,
                      colorOpacity: 0.3,
                      enabled: true,
                      direction: ShimmerDirection.fromLeftToRight(),
                      child: Container(
                        height: 20,
                        color: Colors.grey,
                      ),
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
                  Shimmer(
                    duration: Duration(seconds: 1),
                    color: Colors.white, //Default value
                    colorOpacity: 0.3, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLeftToRight(),
                    child: SizedBox(
                      width: 100.0,
                      child: Container(
                        height: 20,
                        color: Colors.grey,
                      )
                    ),
                  ),
                  const SizedBox(width: 8.0,),
                  Expanded(
                    flex: 2,
                    child: Shimmer(
                      duration: Duration(seconds: 1),
                      color: Colors.white,
                      colorOpacity: 0.3,
                      enabled: true,
                      direction: ShimmerDirection.fromLeftToRight(),
                      child: Container(
                        height: 20,
                        color: Colors.grey,
                      ),
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
                  Shimmer(
                    duration: Duration(seconds: 1),
                    color: Colors.white, //Default value
                    colorOpacity: 0.3, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLeftToRight(),
                    child: SizedBox(
                      width: 100.0,
                      child: Container(
                        height: 20,
                        color: Colors.grey,
                      )
                    ),
                  ),

                  const SizedBox()
                ],
              ),
            ),
            const SizedBox(height: 4.0,),
            Shimmer(
              duration: Duration(seconds: 1),
              color: Colors.white, //Default value
              colorOpacity: 0.3, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLeftToRight(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 50,
                  color: Colors.grey,
                )
              ),
            ),
            const SizedBox(height: 16.0,),
            Shimmer(
              duration: Duration(seconds: 1),
              color: Colors.white, //Default value
              colorOpacity: 0.3, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLeftToRight(),
              child: Container(
                height: 40.0,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsUtil.primaryColor),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey
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