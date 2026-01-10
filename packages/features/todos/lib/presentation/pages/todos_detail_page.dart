import 'package:core/component/appbars/default_appbar_component.dart';
import 'package:core/component/buttons/icon_button_component.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/font_weight.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/date_format.dart';
import 'package:core/utils/sizes.dart';
import 'package:core/utils/text_styles.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/presentation/cubits/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TodosDetailPage extends StatefulWidget {
  const TodosDetailPage({super.key, required this.detailTodos});

  final TodosData detailTodos;

  @override
  State<TodosDetailPage> createState() => _TodosDetailPageState();
}

class _TodosDetailPageState extends State<TodosDetailPage> {

  late TodosCubit _todosCubit;

  @override
  void initState() {
    super.initState();

    _todosCubit = BlocProvider.of<TodosCubit>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppbarComponent(
        title: "Detail To do",
        actions: [
          Container(
            margin: const EdgeInsets.only(right: AppSpacing.defaultMargin),
            child: IconButtonComponent(
              icon: Icons.delete,
              onPressed: () async{
                final result = await _todosCubit.deleteTodos(
                  data: widget.detailTodos
                );

                if (result.status == ResponseCodeEnum.success){
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(message: "Menghapus data todo berhasil")
                  );

                  Navigator.pop(context, true);
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: "Menghapus data todo gagal")
                  );
                }
              },
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 0.1.getHeight(context),
            margin: const EdgeInsets.all(AppSpacing.defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.detailTodos.title.toString(),
                        style: AppTextStyle.kBody1.get().copyWith(
                          fontWeight: AppFontWeight.bold
                        ),
                      ),
                      Text(
                        widget.detailTodos.subTitle.toString(),
                        style: AppTextStyle.kBody1.get(),
                      ),
                      const SizedBox(
                        height: AppSpacing.defaultVerticalSpace,
                      ),
                      Text(
                        AppDateFormat.dd4m4y(DateTime.parse(widget.detailTodos.createAt.toString())).toString(),
                        style: AppTextStyle.kBody1.get(),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.defaultHorizontalSpace,),
                const VerticalDivider(
                  
                  color: Colors.black,
                ),
                const SizedBox(width: AppSpacing.defaultHorizontalSpace,),
                Text(
                  "${"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent augue turpis, tincidunt in neque at, viverra luctus lectus. Nullam euismod hendrerit maximus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque sit amet dictum lorem, a maximus nibh. Vivamus risus purus, consectetur eu risus quis, venenatis dictum justo. Nulla euismod, lectus ut vestibulum interdum, orci dui hendrerit magna, a tristique libero augue ac ipsum. Mauris ut dictum urna. Aenean a lacus nec magna consectetur malesuada et id lacus. Ut vulputate tincidunt neque at rutrum. Quisque at neque vel urna scelerisque elementum. Morbi rutrum id sem aliquet commodo. Nam a orci egestas nulla congue volutpat. Fusce cursus, dolor at sagittis accumsan, nunc sapien egestas dui, vel eleifend nisl tortor at est. Vivamus ut nunc velit.".length} characters",
                  style: AppTextStyle.kBody1.get(),
                )
              ],
            )
          ),
          Container(
            margin: const EdgeInsets.all(AppSpacing.defaultMargin),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent augue turpis, tincidunt in neque at, viverra luctus lectus. Nullam euismod hendrerit maximus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque sit amet dictum lorem, a maximus nibh. Vivamus risus purus, consectetur eu risus quis, venenatis dictum justo. Nulla euismod, lectus ut vestibulum interdum, orci dui hendrerit magna, a tristique libero augue ac ipsum. Mauris ut dictum urna. Aenean a lacus nec magna consectetur malesuada et id lacus. Ut vulputate tincidunt neque at rutrum. Quisque at neque vel urna scelerisque elementum. Morbi rutrum id sem aliquet commodo. Nam a orci egestas nulla congue volutpat. Fusce cursus, dolor at sagittis accumsan, nunc sapien egestas dui, vel eleifend nisl tortor at est. Vivamus ut nunc velit.",
              style: AppTextStyle.kBody1.get(),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      )
    );
  }
}