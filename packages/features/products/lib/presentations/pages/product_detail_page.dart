import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/presentations/states/product_detail_state.dart';
import 'package:products/products.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.id});

  String id;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  late ProductDetailCubit _productDetailCubit;
  late ProductDetailQuantityCubit _productDetailQuantityCubit;

  @override
  void initState(){
    super.initState();

    _productDetailCubit = BlocProvider.of<ProductDetailCubit>(context, listen: false);
    _productDetailQuantityCubit = BlocProvider.of<ProductDetailQuantityCubit>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_){
      _productDetailCubit.getSingleData(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: AppTextStyle.kHeading1.get(),
        ),
      ),
      body: SafeArea(
        child: GenericPage(
          child: BlocConsumer<ProductDetailCubit, ProductDetailStateType>(
            builder: (context, state) {
              if (state.state is ProductDetailFailedState){
                return Center(
                  child: Text(
                    state.error ?? "",
                    style: AppTextStyle.kBody1.get(),
                  ),
                );
              } else if (state.state is ProductDetailLoadedState){
                return Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            floating: true,
                            snap: true,
                            automaticallyImplyLeading: false,
                            expandedHeight: 0.25.getHeight(context),
                            flexibleSpace: FlexibleSpaceBar(
                              background: Image.network(state.data?.image ?? ""),
                            ),
                          ),
                          SliverList.list(
                            children: [
                              const SizedBox(
                                height: 32.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  state.data?.title ?? "",
                                  style: AppTextStyle.kHeading3.get(),
                                ),
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 0.25.getWidth(context),
                                        child: Text(
                                        "Category"
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ": ${state.data?.category}",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 0.25.getWidth(context),
                                        child: Text(
                                        "Rating"
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ": ${state.data?.rating?.rate} (${state.data?.rating?.count})",
                                        style: AppTextStyle.kBody1.get(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  state.data?.description ?? "",
                                  style: AppTextStyle.kBody1.get(),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.1.getHeight(context),
                            alignment: Alignment.center,
                            color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal
                              : 16.0),
                              child: BlocBuilder<ProductDetailQuantityCubit, int>(
                                builder: (context, stateQuantity){
                                  final finalPrice = (state.data?.price ?? 0) * stateQuantity;
                                  return Text(
                                    "\$$finalPrice",
                                    style: AppTextStyle.kHeading1.get(),
                                  );
                                }
                              )
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 0.1.getHeight(context),
                          width: 0.35.getWidth(context),
                          child:  BlocBuilder<ProductDetailQuantityCubit, int>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                                      height: double.infinity,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){
                                            _productDetailQuantityCubit.changeQuantityProduct(
                                              type: TypeChangeQuantity.minus
                                            );
                                          },
                                          splashColor: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                                          child: Icon(Icons.arrow_left, size: 50.0,),
                                        ),
                                      ),
                                    )
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                                      alignment: Alignment.center,
                                      child: Text(
                                        state.toString(),
                                        style: AppTextStyle.kBody1.get().copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                                      height: double.infinity,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){
                                            _productDetailQuantityCubit.changeQuantityProduct(
                                              type: TypeChangeQuantity.plus
                                            );
                                          },
                                          splashColor: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                                          child: Icon(Icons.arrow_right, size: 50.0,),
                                        ),
                                      ),
                                    )
                                  ),
                                ],
                              );
                            },
                          )
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                
                              },
                              splashColor: Theme.of(context).colorScheme.onPrimary,
                              child: SizedBox(
                                height: 0.1.getHeight(context),
                                width: 0.35.getWidth(context),
                                child: Center(
                                  child: Text(
                                    "ADD TO CART",
                                    style: AppTextStyle.kHeading3.get(),
                                  ),
                                )
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Container()
                );
              }
            }, 
            listener: (context, state){
              if (state.state is ProductDetailLoadingState){
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