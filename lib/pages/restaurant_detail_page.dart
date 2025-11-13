
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_well_aurant/cubit/customer_review_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_detail_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_list_cubit.dart';
import 'package:rest_well_aurant/data/models/category_model.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class RestaurantDetailPage extends StatefulWidget {
  RestaurantDetailPage({super.key, required this.data});

  Restaurant data;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {

  late RestaurantDetailCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<RestaurantDetailCubit>(context, listen: false);

    _cubit.getDetailRestaurant(id: widget.data.id ?? "");

    // DUMMY
    widget.data.categories = List.of([
      Category(name: "Italian"),
      Category(name: "Modern"),
    ]);
  }

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
              DetailRestaurantInfoComponent(
                data: widget.data,
              ),
              DetailRestaurantMenuComponent(),
              DetailRestaurantReviewsComponent(),
              DetailRestaurantAddNewReviewComponent(
                data: widget.data,
              ),
              const SizedBox(height: 24.0,)
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRestaurantInfoComponent extends StatelessWidget {
  const DetailRestaurantInfoComponent({
    super.key,
    required this.data,

  });

  final Restaurant data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: data.id ?? "",
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: Image.network(
              "https://restaurant-api.dicoding.dev/images/medium/${data.pictureId}", 
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  data.name ?? "",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(width: 16.0,),
              Icon(Icons.star, color: ColorsUtil.starColor,),
              const SizedBox(width: 4.0,),
              Text(
                data.rating.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Kategori",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: BlocBuilder<RestaurantDetailCubit, GenericState>(
                  builder: (context, state) {
                    if (state.state is RestaurantDetailInitialState || state.state is RestaurantDetailLoadingState){
                      return Wrap(
                        spacing: 8.0,
                        children: [
                          Shimmer(
                            duration: Duration(seconds: 1),
                            color: Colors.white, //Default value
                            colorOpacity: 0.3, //Default value
                            enabled: true, //Default value
                            direction: ShimmerDirection.fromLeftToRight(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorsUtil.primaryColor),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey,
                              ),
                              height: 30,
                              width: 70,
                            ),
                          ),
                          Shimmer(
                            duration: Duration(seconds: 1),
                            color: Colors.white, //Default value
                            colorOpacity: 0.3, //Default value
                            enabled: true, //Default value
                            direction: ShimmerDirection.fromLeftToRight(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorsUtil.primaryColor),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey,
                              ),
                              height: 30,
                              width: 70,
                            ),
                          ),
                        ],
                      );
                    } else if (state.state is RestaurantDetailLoadedState){
                      final Restaurant data = state.data as Restaurant;
                      return Wrap(
                        spacing: 8.0,
                        children: data.categories?.map((category){
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsUtil.primaryColor),
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            child: Text(
                              category.name ?? "",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          );
                        }).toList() ?? [],
                      );
                    } else {
                      return Text(
                        state.message ?? "",
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      );
                    }
                  },
                )
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Kota",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  data.city ?? "",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Alamat",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<RestaurantDetailCubit, GenericState>(
                  builder: (context, state) {
                    if (state.state is RestaurantDetailInitialState || state.state is RestaurantDetailLoadingState){
                      return Shimmer(
                        duration: Duration(seconds: 1),
                        color: Colors.white, //Default value
                        colorOpacity: 0.3, //Default value
                        enabled: true, //Default value
                        direction: ShimmerDirection.fromLeftToRight(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorsUtil.primaryColor),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey,
                          ),
                          height: 25,
                          width: 150,
                        ),
                      );
                    } else if (state.state is RestaurantDetailLoadedState){
                      final Restaurant data = state.data as Restaurant;
                      return Text(
                        data.address ?? "",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.end,
                      );
                    } else {
                      return Text(
                        state.message ?? "",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.end,
                      );
                    }
                  },
                )
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 8.0),
          child: Text(
            "DESKRIPSI",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            data.description ?? "",
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class DetailRestaurantMenuComponent extends StatelessWidget {
  const DetailRestaurantMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 16.0),
          child: Text(
            "MENU",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
          child: Text(
            "Makanan",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        BlocBuilder<RestaurantDetailCubit, GenericState>(
          builder: (context, state) {
            if (state.state is RestaurantDetailInitialState || state.state is RestaurantDetailLoadingState){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 24.0, mainAxisSpacing: 24.0, childAspectRatio: 2), 
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: Duration(seconds: 1),
                      color: Colors.white, //Default value
                      colorOpacity: 0.3, //Default value
                      enabled: true, //Default value
                      direction: ShimmerDirection.fromLeftToRight(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsUtil.primaryColor),
                          color: Colors.grey
                        ),
                        height: 50,
                        width: 75,
                      ),
                    );
                  },
                )
              );
            } else if (state.state is RestaurantDetailLoadedState){
              final data = state.data as Restaurant;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 24.0, mainAxisSpacing: 24.0, childAspectRatio: 2), 
                  itemCount: data.menus?.foods?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsUtil.primaryColor)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          data.menus?.foods?[index].name ?? "",
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    );
                  },
                )
              );
            } else {
              return Center(child: Text(
                state.message ?? "",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ));
            }
          },
        ),
        const SizedBox(height: 16.0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
          child: Text(
            "Minuman",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        BlocBuilder<RestaurantDetailCubit, GenericState>(
          builder: (context, state) {
            if (state.state is RestaurantDetailInitialState || state.state is RestaurantDetailLoadingState){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 24.0, mainAxisSpacing: 24.0, childAspectRatio: 2), 
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: Duration(seconds: 1),
                      color: Colors.white, //Default value
                      colorOpacity: 0.3, //Default value
                      enabled: true, //Default value
                      direction: ShimmerDirection.fromLeftToRight(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsUtil.primaryColor),
                          color: Colors.grey
                        ),
                        height: 50,
                        width: 75,
                      ),
                    );
                  },
                )
              );
            } else if (state.state is RestaurantDetailLoadedState){
              final data = state.data as Restaurant;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 24.0, mainAxisSpacing: 24.0, childAspectRatio: 2), 
                  itemCount: data.menus?.drinks?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsUtil.primaryColor)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          data.menus?.drinks?[index].name ?? "",
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    );
                  },
                )
              );
            } else {
              return Center(child: Text(
                state.message ?? "",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ));
            }
          },
        ),
      ],
    );
  }
}

class DetailRestaurantReviewsComponent extends StatelessWidget {
  const DetailRestaurantReviewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 16.0),
          child: Text(
            "REVIEWS",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<RestaurantDetailCubit, GenericState>(
            builder: (context, state) {
              if (state.state is RestaurantDetailInitialState || state.state is RestaurantDetailLoadingState){
                return ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 8.0,
                      children: [
                        Shimmer(
                          duration: Duration(seconds: 1),
                          color: Colors.white, //Default value
                          colorOpacity: 0.3, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLeftToRight(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsUtil.primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey,
                            ),
                            height: 30,
                            width: 100,
                          ),
                        ),
                        Shimmer(
                          duration: Duration(seconds: 1),
                          color: Colors.white, //Default value
                          colorOpacity: 0.3, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLeftToRight(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsUtil.primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey,
                            ),
                            height: 70,
                          ),
                        ),
                        Divider(
                          color: ColorsUtil.primaryColor,
                        )
                      ],
                    );
                  },
                );
              } else if (state.state is RestaurantDetailLoadedState){
                final data = state.data as Restaurant;
                return ListView.builder(
                  itemCount: data.customerReviews?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 8.0,
                      children: [
                        const SizedBox(),
                        RichText(
                          text: TextSpan(
                            text: data.customerReviews?[index].name ?? "",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: " (${data.customerReviews?[index].date})",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                                )
                              )
                            ]
                          ),
                        ),
                        Text(
                          data.customerReviews?[index].review ?? "",
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Divider(
                          color: ColorsUtil.primaryColor,
                        )
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    state.message ?? "",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class DetailRestaurantAddNewReviewComponent extends StatefulWidget {
  DetailRestaurantAddNewReviewComponent({
    super.key,
    required this.data
  });

  Restaurant data;

  @override
  State<DetailRestaurantAddNewReviewComponent> createState() => _DetailRestaurantAddNewReviewComponentState();
}

class _DetailRestaurantAddNewReviewComponentState extends State<DetailRestaurantAddNewReviewComponent> {

  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _reviewController;

  late CustomerReviewListCubit _customerCubit;
  late RestaurantDetailCubit _restaurantDetailCubit;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _reviewController = TextEditingController();

    _customerCubit = BlocProvider.of<CustomerReviewListCubit>(context, listen: false);
    _restaurantDetailCubit = BlocProvider.of<RestaurantDetailCubit>(context, listen: false);    
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _reviewController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 16.0),
            child: Text(
              "TAMBAH REVIEW BARU",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Nama",
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ),
          const SizedBox(height: 4.0,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                hint: Text(
                  "Masukkan nama anda",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.withAlpha(225)
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value == ""){
                  return "Field nama required";
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Review",
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ),
          const SizedBox(height: 4.0,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: TextFormField(
              controller: _reviewController,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                hint: Text(
                  "Masukkan review anda",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.withAlpha(225)
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value == ""){
                  return "Field review required";
                }

                return null;
              },
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
                onTap: () async{
                  if (_formKey.currentState!.validate()){

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mengirim review Anda')),
                    );

                    await _customerCubit.addCustomerReview(
                      id: widget.data.id ?? "", 
                      name: _nameController.text, 
                      review: _reviewController.text
                    );

                    await _restaurantDetailCubit.getDetailRestaurant(id: widget.data.id ?? "");

                    if (mounted){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Berhasil mengirim review Anda')),
                      );

                      _nameController.text = "";
                      _reviewController.text = "";
                    }
                  }
                },
                borderRadius: BorderRadius.circular(8.0),
                splashColor: ColorsUtil.primaryColor.withAlpha(200),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "KIRIM",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}