import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/presentations/cubits/product_list_cubit.dart';
import 'package:products/presentations/states/product_category_state.dart';
import 'package:products/presentations/states/product_list_state.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  late ProductListCubit _productListCubit;
  late ProductCategoryCubit _productCategoryCubit;

  String? _category;
  String? _limit;
  String? _sort;

  @override
  void initState(){
    super.initState();

    _productListCubit = BlocProvider.of<ProductListCubit>(context, listen: false);
    _productCategoryCubit = BlocProvider.of<ProductCategoryCubit>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_){
      _productListCubit.getAllProducts();
      _productCategoryCubit.getAllCategory();
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
          child: BlocConsumer<ProductListCubit, ProductListStateType>(
            builder: (context, state) {
              if (state.state is ProductListFailedState){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      expandedHeight: 0.125.getHeight(context),
                      floating: true,
                      snap: true,
                      pinned: true,
                      title: Row(
                        children: [
                          Text(
                            "List Product",
                            style: AppTextStyle.kHeading2.get(),
                          )
                        ],
                      ),
                      bottom: AppBar(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        title: Text(
                          "List Product",
                          style: AppTextStyle.kHeading2.get(),
                        )
                      ),
                    ),
                    SliverList.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            state.message ?? "",
                            style: AppTextStyle.kBody1.get(),
                          ),
                        );
                      },
                    )
                  ],
                );
              } else if (state.state is ProductListLoadedState){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      floating: true,
                      snap: true,
                      pinned: true,
                      title: Text(
                        "List Product",
                        style: AppTextStyle.kHeading1.get(),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0.1.getHeight(context)), 
                        child: Container(
                          height: 0.1.getHeight(context),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 4.0,
                              children: [
                                Container(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  width: 0.5.getWidth(context),
                                  child: BlocBuilder<ProductCategoryCubit, ProductCategoryStateType>(
                                    builder: (context, state) {
                                      List<DropdownMenuItem<String>> itemCategory = [
                                        DropdownMenuItem(
                                          value: "select_category",
                                          enabled: false,
                                          child: Text(
                                            "Select Category",
                                            style: AppTextStyle.kBody1.get(),
                                          ),
                                        ),
                                      ];

                                      if (state.state is ProductCategoryLoadedState){
                                        itemCategory.addAll(
                                          (state.data ?? []).map<DropdownMenuItem<String>>((value){
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: AppTextStyle.kBody1.get(),
                                              ),
                                            );
                                          }).toList()
                                        );
                                      }

                                      return DropdownButtonFormField(
                                        initialValue: "select_category",
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, 
                                            vertical: 8.0
                                          ),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                                          ),
                                          focusColor: Theme.of(context).colorScheme.primary,
                                          isDense: true
                                        ),
                                        items: itemCategory,
                                        onChanged: (value){
                                                                
                                        }
                                      );
                                    },
                                  )
                                ),
                                Container(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  width: 0.3.getWidth(context),
                                  child: DropdownButtonFormField(
                                    initialValue: "select_limit",
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, 
                                        vertical: 8.0
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                                      ),
                                      focusColor: Theme.of(context).colorScheme.primary,
                                      isDense: true
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: "select_limit",
                                        enabled: false,
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
                                    onChanged: (value){
                                                            
                                    }
                                  ),
                                ),
                                Container(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  width: 0.25.getWidth(context),
                                  child: DropdownButtonFormField(
                                    initialValue: "select_sort",
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, 
                                        vertical: 8.0
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                                      ),
                                      focusColor: Theme.of(context).colorScheme.primary,
                                      isDense: true
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: "select_sort",
                                        enabled: false,
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
                                    onChanged: (value){
                                                            
                                    }
                                  ),
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
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, AppPageRoutesName.productDetailPage, arguments: state.data?[index].id.toString());
                              },
                              splashColor: Theme.of(context).colorScheme.secondary.withAlpha(120),
                              child: Container(
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
                                        child: Image.network(state.data?[index].image ?? "",fit: BoxFit.contain,),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: .stretch,
                                        children: [
                                          Text(
                                            state.data?[index].title ?? "",
                                            style: AppTextStyle.kBody1.get(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "\$${state.data?[index].price}",
                                            style: AppTextStyle.kHeading2.get(),
                                          ),
                                          const SizedBox(height: 16.0,),
                                          Wrap(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(AppNumbers.defaultRadius),
                                                  border: BoxBorder.all(color: Theme.of(context).colorScheme.primary)
                                                ),
                                                child: Text(
                                                  state.data?[index].category ?? "",
                                                  style: AppTextStyle.kBody1.get(),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      expandedHeight: 0.125.getHeight(context),
                      floating: true,
                      snap: true,
                      pinned: true,
                      title: Row(
                        children: [
                          Text(
                            "Product",
                            style: AppTextStyle.kHeading2.get(),
                          )
                        ],
                      ),
                      bottom: AppBar(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        title: Text(
                          "List Product",
                          style: AppTextStyle.kHeading2.get(),
                        )
                      ),
                    ),
                    SliverList.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            "There is no data available",
                            style: AppTextStyle.kBody1.get(),
                          ),
                        );
                      },
                    )
                  ],
                );
              }
            },
            listener: (context, state){
              if (state.state is ProductListLoadingState){
                loadingComponent(context, show: true);
              } else {
                loadingComponent(context, show: false);
              }
            },
          )
        ),
      ),
    );
  }
}