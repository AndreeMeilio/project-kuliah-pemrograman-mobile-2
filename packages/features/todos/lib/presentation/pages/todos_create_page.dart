import 'package:core/component/appbars/default_appbar_component.dart';
import 'package:core/component/buttons/primary_button_component.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/utils/generic_state.dart';
import 'package:todos/presentation/cubits/todos_cubit.dart';
import 'package:todos/presentation/states/todos_state.dart';
import 'package:todos/presentation/widgets/todos_create_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TodosCreatePage extends StatefulWidget {
  const TodosCreatePage({super.key});

  @override
  State<TodosCreatePage> createState() => _TodosCreatePageState();
}

class _TodosCreatePageState extends State<TodosCreatePage> {

  late GlobalKey<FormState> _formKey;
  late TextEditingController _judulController;
  late TextEditingController _subJudulController;
  late TextEditingController _contentController;

  late TodosCubit _todosCubit;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _judulController = TextEditingController();
    _subJudulController = TextEditingController();
    _contentController = TextEditingController();

    _todosCubit = BlocProvider.of(context, listen: false);
  }

  @override
  void dispose() {
    _judulController.dispose();
    _subJudulController.dispose();
    _contentController.dispose();  

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const DefaultAppbarComponent(
        title: "Buat To Do",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TodosCreateFormWidget(
              formKey: _formKey,
              judulController: _judulController,
              subJudulController: _subJudulController,
              contentController: _contentController,
            ),
          ),
          const SizedBox(height: AppSpacing.defaultMargin,),
          Container(
            margin: const EdgeInsets.all(AppSpacing.defaultMargin),
            child: BlocConsumer<TodosCubit, GenericState>(
              builder: (context, state) => PrimaryButtonComponent(
                label: "Simpan",
                isLoading: state.state is TodosLoadingState ? true : false,
                onTap: () async{
                  if (!(_formKey.currentState!.validate())){
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(message: "Harap memasukkan data yang sesuai format")
                    );
                  } else {
                    final result = await _todosCubit.insertDataTodos(
                      judul: _judulController.text,
                      subJudul: _subJudulController.text,
                      content: _contentController.text
                    );

                    if (result.status == ResponseCodeEnum.success){
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(message: "Membuat data todo berhasil")
                      );

                      Navigator.pop(context, true);
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: "Membuat data todo gagal")
                      );
                    }
                  }
                },
              ),
              listener: (context, state) {
                if (state is TodosLoadedState){
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(message: "${state.message}")
                  );

                  Navigator.pop(context, true);
                } else {
                }
              },
            )
          )
        ],
      )
    );
  }
}