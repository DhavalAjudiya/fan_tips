import 'package:fantips/utills/asset.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/cupertino.dart';

class Foodie {
  List<Map> category = [
    {
      "image": AppImage.solution,
      "name": AppString.solution,
    },
    {
      "image": AppImage.working,
      "name": AppString.working,
    },
    {
      "image": AppImage.mindset,
      "name": AppString.mindset,
      "next": AppString.next,
    },
  ];
}
