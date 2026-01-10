
import 'package:core/component/buttons/icon_button_component.dart';
import 'package:core/component/buttons/primary_button_component.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/locale.dart';
import 'package:core/constant/routes.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/localizations/cubit/app_localizations_cubit.dart';
import 'package:core/logger/log.dart';
import 'package:core/utils/generic_state.dart';
import 'package:core/utils/locators.dart';
import 'package:core/utils/text_styles.dart';
import 'package:countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/presentation/cubits/todos_cubit.dart';
import 'package:todos/presentation/states/todos_state.dart';
import 'package:todos/presentation/widgets/todos_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/localizations/gen/app_localizations.dart';

class TodosListPage extends StatefulWidget {
  const TodosListPage({super.key});

  @override
  State<TodosListPage> createState() => TodosListPageState();
}

class TodosListPageState extends State<TodosListPage> {

  late TodosCubit _todosCubit;

  @override
  void initState() {
    super.initState();

    _todosCubit = BlocProvider.of<TodosCubit>(context, listen: false);
    _todosCubit.getDataTodos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSpacing.defaultMargin,
            ),
            Text(
              AppLocalizations.of(context).hello_world
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.defaultMargin),
                    child: Text(
                      "Daftar To do",
                      style: AppTextStyle.kHeading1.get(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: AppSpacing.defaultMargin),
                  child: IconButtonComponent(
                    icon: Icons.delete,
                    onPressed: () async{
                      Navigator.pushNamed(context, AppRoutesName.countryList);
                    },
                  )
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.defaultHorizontalSpace,),
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.defaultMargin),
              child: PrimaryButtonComponent(
                label: "Buat To Do",
                onTap: () async{
                  final createTodo = await Navigator.pushNamed(context, AppRoutesName.todosCreate);

                  if ((createTodo as bool?) ?? false){
                    await _todosCubit.getDataTodos();
                  }
                },
              )
            ),
            const SizedBox(height: AppSpacing.defaultHorizontalSpace,),
            BlocConsumer<TodosCubit, GenericState>(
              builder: (context, state) {
                if (state.state is TodosLoadingState){
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.state is TodosLoadedState){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: (state.data as List<TodosData>).length,
                      padding: const EdgeInsets.only(bottom: AppSpacing.defaultMargin),
                      itemBuilder: (context, index) {
                        return TodosListItemWidget(
                          title: (state.data as List<TodosData>)[index].title.toString(),
                          subTitle: (state.data as List<TodosData>)[index].subTitle.toString(),
                          date: (state.data as List<TodosData>)[index].createAt.toString(),
                          onTap: () async{
                            final result = await Navigator.pushNamed(
                              context,
                              AppRoutesName.todosDetail,
                              arguments: (state.data as List<TodosData>)[index]
                            );

                            if ((result as bool?) ?? false){
                              _todosCubit.getDataTodos();
                            }
                          },
                        );
                      },
                    )
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "Terjadi kesalahan saat memuat data",
                        style: AppTextStyle.kBody1.get(),
                      ),
                    ),
                  );
                }
              }, 
              listener: (context, state) {
                
              },
            )
          ],
        ),
      ),
    );
  }
}