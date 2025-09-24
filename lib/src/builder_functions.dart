import 'package:flutter/widgets.dart';

typedef RxBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorBuilder<T> = Widget Function(BuildContext context, Object error);
typedef BusyBuilder = Widget Function(BuildContext context);
typedef PlaceHolderBuilder = Widget Function(BuildContext context);

typedef RxErrorWidget = Widget Function(Object error);
typedef RxWidget<T> = Widget Function(T data);
typedef RxWidget2<T1, T2> = Widget Function(T1 data1, T2 data2);
typedef RxWidget3<T1, T2, T3> = Widget Function(T1 data1, T2 data2, T3 data3);
typedef RxWidget4<T1, T2, T3, T4> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4);
typedef RxWidget5<T1, T2, T3, T4, T5> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4, T5 data5);
typedef RxWidget6<T1, T2, T3, T4, T5, T6> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4, T5 data5, T6 data6);
typedef RxWidget7<T1, T2, T3, T4, T5, T6, T7> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4, T5 data5, T6 data6, T7 data7);
typedef RxWidget8<T1, T2, T3, T4, T5, T6, T7, T8> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4, T5 data5, T6 data6, T7 data7, T8 data8);
typedef RxWidget9<T1, T2, T3, T4, T5, T6, T7, T8, T9> = Widget Function(
    T1 data1, T2 data2, T3 data3, T4 data4, T5 data5, T6 data6, T7 data7, T8 data8, T9 data9);
