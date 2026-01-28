import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:carts/presentations/cubits/carts_list_cubit.dart';
import 'package:carts/presentations/states/carts_list_state.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsListPage extends StatefulWidget {
  const CartsListPage({super.key});

  @override
  State<CartsListPage> createState() => _CartsListPageState();
}

class _CartsListPageState extends State<CartsListPage> {

  late CartsListCubit _cartsListCubit;

  @override
  void initState(){
    super.initState();

    _cartsListCubit = BlocProvider.of<CartsListCubit>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartsListCubit.getAllCarts();
    });
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GenericPage(
        child: SafeArea(
          child: BlocConsumer<CartsListCubit, CartsListStateType>(
            builder: (context, state){
              if (state.state is CartsListFailedState){
                return Center(
                  child: Text(
                    state.error ?? "",
                    style: AppTextStyle.kBody1.get(),
                  ),
                );
              } else if (state.state is CartsListLoadedState){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      floating: true,
                      snap: true,
                      pinned: true,
                      title: Text(
                        "List Carts",
                        style: AppTextStyle.kHeading1.get(),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0.1.getHeight(context)), 
                        child: Container(
                          height: 0.1.getHeight(context),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 4.0,
                              children: [
                                CustomDropdownButton<String>(
                                  width: 0.3.getWidth(context),
                                  initialValue: "select_limit", 
                                  items: [
                                    DropdownMenuItem(
                                      value: "select_limit",
                                      child: Text(
                                        "Limit",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "all",
                                      child: Text(
                                        "ALL",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "5",
                                      child: Text(
                                        "5 Data",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "10",
                                      child: Text(
                                        "10 Data",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "20",
                                      child: Text(
                                        "20 Data",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                  ], 
                                  onChanged: (value) async{
                                              
                                  }
                                ),
                                CustomDropdownButton<String>(
                                  width: 0.25.getWidth(context),
                                  initialValue: "select_sort", 
                                  items: [
                                    DropdownMenuItem(
                                      value: "select_sort",
                                      child: Text(
                                        "Sort",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "asc",
                                      child: Text(
                                        "ASC",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "desc",
                                      child: Text(
                                        "DESC",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    ),
                                  ], 
                                  onChanged: (value) async{      
                                  }
                                ),
                              ],
                            ),
                          )
                        )
                      ),
                    ),
                    SliverList.builder(
                      itemCount: state.data?.length,
                      itemBuilder: (context, index) {
                        final data = state.data?[index];
                        String dateCart = "";
                        int totalProduct = 0;
                        int totalQuantity = 0;

                        if (data?.date case DateTime timeCart){
                          dateCart = AppDateFormat.dd4m4y(timeCart);
                        }

                        if (data?.detailProducts case List<CartProductDetail> dataDetailProduct){
                          for(final detail in dataDetailProduct){
                            totalQuantity += detail.quantity ?? 0;
                          }

                          totalProduct = dataDetailProduct.length;
                        }

                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppPageRoutesName.cartDetailPage, arguments: state.data?[index].id.toString());
                              },
                              splashColor: Theme.of(context).colorScheme.secondary.withAlpha(120),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: .stretch,
                                  spacing: 4.0,
                                  children: [
                                    Text(
                                      "Date: $dateCart",
                                      style: AppTextStyle.kBody1.get().copyWith(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "Total Product: $totalProduct",
                                      style: AppTextStyle.kBody1.get()
                                    ),
                                    Text(
                                      "Total Quantity: $totalQuantity",
                                      style: AppTextStyle.kBody1.get()
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              } else {
                return Container();
              }
            }, 
            listener: (context, state){
              if (state.state is CartsListLoadingState){
                loadingComponent(context, show: true);
              } else {
                loadingComponent(context, show: false);
              }
            }
          )
        ),
      ),
    );
  }
}