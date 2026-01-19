
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int>{
  HomeCubit(): super(0);

  void changeTabIndex(int index){
    emit(index);
  }
}