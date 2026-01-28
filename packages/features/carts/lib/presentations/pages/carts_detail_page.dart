import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:carts/presentations/cubits/carts_detail_cubit.dart';
import 'package:carts/presentations/states/carts_detail_state.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsDetailPage extends StatefulWidget {
  const CartsDetailPage({super.key, required this.id});

  final String id;

  @override
  State<CartsDetailPage> createState() => _CartsDetailPageState();
}

class _CartsDetailPageState extends State<CartsDetailPage> {

  late CartsDetailCubit _cartsDetailCubit;

  @override
  void initState(){
    super.initState();

    _cartsDetailCubit = BlocProvider.of<CartsDetailCubit>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartsDetailCubit.getDetailCart(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Cart Detail",
          style: AppTextStyle.kHeading1.get(),
        ),
      ),
      body: SafeArea(
        child: GenericPage(
          child: BlocConsumer<CartsDetailCubit, CartsDetailStateType>(
            builder: (context, state){
              if (state.state is CartsDetailFailedState){
                return Center(
                  child: Text(
                    state.error.toString(),
                    style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                  ),
                );
              } else if (state.state is CartsDetailLoadedState){
                final dataProducts = state.data?.detailProducts;
                double totalPrice = 0.0;
                int totalQuantity = 0;
                int totalProduct = 0;

                if (state.data?.detailProducts case List<CartProductDetail> dataDetailProduct){
                  for(final detail in dataDetailProduct){
                    totalQuantity += detail.quantity ?? 0;
                    totalPrice += double.parse(detail.quantity.toString()) * double.parse(detail.product?.price.toString() ?? "0.0");
                  }

                  totalProduct = dataDetailProduct.length;
                }

                return Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList.list(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  spacing: 8.0,
                                  children: [
                                    const SizedBox(height: 16.0,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Date",
                                            style: AppTextStyle.kBody1.get()
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppDateFormat.dd4m4y(state.data!.date!),
                                            style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Total Products",
                                            style: AppTextStyle.kBody1.get()
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "$totalProduct Products",
                                            style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Total Quantity",
                                            style: AppTextStyle.kBody1.get()
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "$totalQuantity Quantity",
                                            style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16.0,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  "List Products",
                                  style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 8.0,),
                            ],
                          ),
                          SliverList.builder(
                            itemCount: dataProducts?.length,
                            itemBuilder: (context, index) {
                              final subTotal = double.parse(dataProducts?[index].quantity.toString() ?? "0.0") * double.parse(dataProducts?[index].product?.price.toString() ?? "0.0");

                              return Container(
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 8.0),
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  spacing: 16.0,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 0.125.getHeight(context),
                                        width: 0.25.getWidth(context),
                                        child: Image.network(dataProducts?[index].product?.image ?? "",fit: BoxFit.contain,),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: .stretch,
                                        children: [
                                          Text(
                                            dataProducts?[index].product?.title ?? "",
                                            style: AppTextStyle.kBody1.get(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "\$${dataProducts?[index].product?.price}",
                                            style: AppTextStyle.kHeading2.get(),
                                          ),
                                          const SizedBox(height: 4.0,),
                                          Wrap(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(AppNumbers.defaultRadius),
                                                  border: BoxBorder.all(color: Theme.of(context).colorScheme.primary)
                                                ),
                                                child: Text(
                                                  dataProducts?[index].product?.category ?? "",
                                                  style: AppTextStyle.kBody1.get(),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 8.0,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Total Quantity",
                                                  style: AppTextStyle.kBody1.get()
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "${dataProducts?[index].quantity} Quantity",
                                                  style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4.0,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Sub Total",
                                                  style: AppTextStyle.kBody1.get()
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "\$$subTotal",
                                                  style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                      height: 0.1.getHeight(context),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Total \$$totalPrice",
                        style: AppTextStyle.kHeading1.get(),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            }, 
            listener: (context, state){
              if (state.state is CartsDetailLoadingState){
                loadingComponent(context, show: true);
              } else {
                loadingComponent(context, show: false);
              }
            }
          ),
        ),
      ),
    );
  }
}