import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shimmer/shimmer.dart';

class Utils {
  static Widget mainShimmer({@required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Shimmer.fromColors(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 20.0),
            child: Container(
              width: 250.0,
              height: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.grey
                    : Colors.grey.withOpacity(.3),
              ),
            ),
          ),
          baseColor: Colors.black26,
          highlightColor: Colors.white12,
        ),
        Shimmer.fromColors(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 20.0),
            child: Container(
              width: 300.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.grey
                    : Colors.grey.withOpacity(.3),
              ),
            ),
          ),
          baseColor: Colors.black26,
          highlightColor: Colors.white12,
        ),
        Shimmer.fromColors(
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 40.0, right: 20.0),
            child: Container(
              width: 70.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.grey
                    : Colors.grey.withOpacity(.3),
              ),
            ),
          ),
          baseColor: Colors.black26,
          highlightColor: Colors.white12,
        ),
        Shimmer.fromColors(
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 40.0, right: 20.0),
            child: Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.grey
                    : Colors.grey.withOpacity(.3),
              ),
            ),
          ),
          baseColor: Colors.black26,
          highlightColor: Colors.white12,
        ),
      ],
    );
  }

  static String getMonthName({@required String number}) {
    switch (number) {
      case '01':
        return 'JANEIRO';
      case '02':
        return 'FEVEREIRO';
      case '03':
        return 'MARÇO';
      case '04':
        return 'ABRIL';
      case '05':
        return 'MAIO';
      case '06':
        return 'JUNHO';
      case '07':
        return 'JULHO';
      case '08':
        return 'AGOSTO';
      case '09':
        return 'SETEMBRO';
      case '10':
        return 'OUTUBRO';
      case '11':
        return 'NOVEMBRO';
      case '12':
        return 'DEZEMBRO';
      default:
        return '';
    }
  }
}
