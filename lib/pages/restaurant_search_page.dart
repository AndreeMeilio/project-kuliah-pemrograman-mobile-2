import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_well_aurant/cubit/customer_review_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_detail_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_search_cubit.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/pages/components/itemRestaurantLoadingComponent.dart';
import 'package:rest_well_aurant/pages/components/item_restaurant_component.dart';
import 'package:rest_well_aurant/pages/restaurant_detail_page.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

class RestaurantSearchPage extends StatefulWidget {
  const RestaurantSearchPage({super.key});

  @override
  State<RestaurantSearchPage> createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage> {

  late RestaurantSearchCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<RestaurantSearchCubit>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  hint: Text(
                    "Masukkan nama restaurant",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.withAlpha(200)
                    ),
                  ),
                  prefixIcon: Icon(Icons.search)
                ),
                onChanged: (value) async{
                  if (value.isEmpty){
                    _cubit.resetStateSearchRestaurant();
                  } else {
                    await _cubit.searchRestaurant(key: value);
                  } 
                },
              ),
            ),
            const SizedBox(height: 24.0,),
            Expanded(
              child: BlocBuilder<RestaurantSearchCubit, GenericState>(
                builder: (context, state) {
                  if (state.state is RestaurantSearchInitialState){
                    return Center(
                      child: Text(
                        "Cari restaurant berdasarkan Nama Restaurant",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withAlpha(200)
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state.state is RestaurantSearchLoadingState){
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ItemRestaurantComponentLoading();
                      },
                    );
                  } else if (state.state is RestaurantSearchLoadedState){
                    final data = state.data as List<Restaurant>;
                    if (data.isNotEmpty){
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
                                builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider<RestaurantDetailCubit>(
                                      create: (context) => RestaurantDetailCubit(),
                                    ),
                                    BlocProvider<CustomerReviewListCubit>(
                                      create: (context) => CustomerReviewListCubit(),
                                    )
                                  ], 
                                  child: RestaurantDetailPage(data: data[index])
                                ),
                              ));
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Data tidak ditemukan",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ); 
                    }
                  } else {
                    return Center(
                      child: Text(
                        state.message ?? "",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ); 
                  }
                },
              )
            ),            
          ],
        ),
      ),
    );
  }
}