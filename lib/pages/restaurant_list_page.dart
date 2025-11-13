
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_well_aurant/cubit/restaurant_list_cubit.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/pages/components/itemRestaurantLoadingComponent.dart';
import 'package:rest_well_aurant/pages/components/item_restaurant_component.dart';
import 'package:rest_well_aurant/pages/restaurant_detail_page.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  
  late RestaurantListCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<RestaurantListCubit>(context, listen: false);
    _cubit.getListRestaurant();
  }

  @override
  void dispose() {
    super.dispose();

    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16.0,
          children: [
            const SizedBox(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Daftar Restoran",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<RestaurantListCubit, GenericState>(
                builder: (context, state) {
                  if (state.state is RestaurantListInitialState || state.state is RestaurantListLoadingState){
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ItemRestaurantComponentLoading();
                      },
                    );
                  } else if (state.state is RestaurantListLoadedState){
                    final data = state.data as List<Restaurant>;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ItemRestaurantComponent(
                          id: data[index].id ?? "",
                          idImage: data[index].pictureId.toString(), 
                          titleRestaurant: data[index].name ?? "", 
                          cityRestaurant: data[index].city ?? "", 
                          rating: data[index].rating ?? 0.0, 
                          description: data[index].description ?? "",
                          detailOnTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RestaurantDetailPage(data: data[index]),
                            ));
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/errorimage.png"),
                          Text(
                            state.message ?? "",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ),
          ],  
        )
      ),
    );
  }
}