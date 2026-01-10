
import 'package:core/constant/routes.dart';
import 'package:countries/presentation/pages/country_list_page.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/presentation/pages/todos_create_page.dart';
import 'package:todos/presentation/pages/todos_detail_page.dart';
import 'package:todos/presentation/pages/todos_list_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case AppRoutesName.todosList:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const TodosListPage()
        );
      case AppRoutesName.todosDetail:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: TodosDetailPage(
            detailTodos: settings.arguments as TodosData,
          )
        );
      case AppRoutesName.todosCreate:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const TodosCreatePage()
        ); 
      case AppRoutesName.countryList:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const CountryListPage()
        );
      default: 
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const TodosListPage()
        );  
    }
  }
}