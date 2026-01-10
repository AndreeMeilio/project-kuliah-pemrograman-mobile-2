
import 'package:flutter/material.dart';

extension AppSizesExtention on double{
  double getWidth(BuildContext context){
    return MediaQuery.sizeOf(context).width * this;
  }

  double getHeight(BuildContext context){
    return MediaQuery.sizeOf(context).height * this;
  }
}