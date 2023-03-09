import 'package:flutter/widgets.dart';

import 'builder_functions.dart';
import 'reactive_base_widget.dart';

class ReactiveWidget<T> extends ReactiveBaseWidget<T> {
  final RxWidget<T> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  const ReactiveWidget({
    Key? key,
    required Stream<T> stream,
    T? initialData,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  }) : super(stream, initialData, key: key);

  @override
  Widget build(BuildContext context, T data) => widget(data);

  @override
  Widget placeHolderBuild(BuildContext context) {
    if (placeHolderWidget != null) return placeHolderWidget!;
    return super.placeHolderBuild(context);
  }

  @override
  Widget errorBuild(BuildContext context, Object error) {
    if (errorWidget != null) return errorWidget!(error);
    return super.errorBuild(context, error);
  }
}

class ReactiveWidget2<T1, T2> extends StatelessWidget {
  const ReactiveWidget2({
    super.key,
    required this.stream1,
    required this.stream2,
    this.initialData1,
    this.initialData2,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  });

  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final T1? initialData1;
  final T2? initialData2;
  final RxWidget2<T1, T2> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget<T1>(
      stream: stream1,
      initialData: initialData1,
      placeHolderWidget: placeHolderWidget,
      errorWidget: errorWidget,
      widget: (data1) => ReactiveWidget<T2>(
        stream: stream2,
        initialData: initialData2,
        placeHolderWidget: placeHolderWidget,
        errorWidget: errorWidget,
        widget: (data2) => widget(data1, data2),
      ),
    );
  }
}

class ReactiveWidget3<T1, T2, T3> extends StatelessWidget {
  const ReactiveWidget3({
    super.key,
    required this.stream1,
    required this.stream2,
    required this.stream3,
    this.initialData1,
    this.initialData2,
    this.initialData3,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  });

  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final T1? initialData1;
  final T2? initialData2;
  final T3? initialData3;
  final RxWidget3<T1, T2, T3> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget2(
      stream1: stream1,
      stream2: stream2,
      initialData1: initialData1,
      initialData2: initialData2,
      widget: (data1, data2) => ReactiveWidget<T3>(
        stream: stream3,
        initialData: initialData3,
        placeHolderWidget: placeHolderWidget,
        errorWidget: errorWidget,
        widget: (data3) => widget(data1, data2, data3),
      ),
    );
  }
}

class ReactiveWidget4<T1, T2, T3, T4> extends StatelessWidget {
  const ReactiveWidget4({
    super.key,
    required this.stream1,
    required this.stream2,
    required this.stream3,
    required this.stream4,
    this.initialData1,
    this.initialData2,
    this.initialData3,
    this.initialData4,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  });

  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final T1? initialData1;
  final T2? initialData2;
  final T3? initialData3;
  final T4? initialData4;
  final RxWidget4<T1, T2, T3, T4> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget3(
      stream1: stream1,
      stream2: stream2,
      stream3: stream3,
      initialData1: initialData1,
      initialData2: initialData2,
      initialData3: initialData3,
      widget: (data1, data2, data3) => ReactiveWidget<T4>(
        stream: stream4,
        initialData: initialData4,
        placeHolderWidget: placeHolderWidget,
        errorWidget: errorWidget,
        widget: (data4) => widget(data1, data2, data3, data4),
      ),
    );
  }
}

class ReactiveWidget5<T1, T2, T3, T4, T5> extends StatelessWidget {
  const ReactiveWidget5({
    super.key,
    required this.stream1,
    required this.stream2,
    required this.stream3,
    required this.stream4,
    required this.stream5,
    this.initialData1,
    this.initialData2,
    this.initialData3,
    this.initialData4,
    this.initialData5,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  });

  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;
  final T1? initialData1;
  final T2? initialData2;
  final T3? initialData3;
  final T4? initialData4;
  final T5? initialData5;
  final RxWidget5<T1, T2, T3, T4, T5> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget4(
      stream1: stream1,
      stream2: stream2,
      stream3: stream3,
      stream4: stream4,
      initialData1: initialData1,
      initialData2: initialData2,
      initialData3: initialData3,
      initialData4: initialData4,
      widget: (data1, data2, data3, data4) => ReactiveWidget<T5>(
        stream: stream5,
        initialData: initialData5,
        placeHolderWidget: placeHolderWidget,
        errorWidget: errorWidget,
        widget: (data5) => widget(data1, data2, data3, data4, data5),
      ),
    );
  }
}

class ReactiveWidget6<T1, T2, T3, T4, T5, T6> extends StatelessWidget {
  const ReactiveWidget6({
    super.key,
    required this.stream1,
    required this.stream2,
    required this.stream3,
    required this.stream4,
    required this.stream5,
    required this.stream6,
    this.initialData1,
    this.initialData2,
    this.initialData3,
    this.initialData4,
    this.initialData5,
    this.initialData6,
    required this.widget,
    this.placeHolderWidget,
    this.errorWidget,
  });

  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;
  final Stream<T6> stream6;
  final T1? initialData1;
  final T2? initialData2;
  final T3? initialData3;
  final T4? initialData4;
  final T5? initialData5;
  final T6? initialData6;
  final RxWidget6<T1, T2, T3, T4, T5, T6> widget;
  final RxErrorWidget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget5(
      stream1: stream1,
      stream2: stream2,
      stream3: stream3,
      stream4: stream4,
      stream5: stream5,
      initialData1: initialData1,
      initialData2: initialData2,
      initialData3: initialData3,
      initialData4: initialData4,
      initialData5: initialData5,
      widget: (data1, data2, data3, data4, data5) => ReactiveWidget<T6>(
        stream: stream6,
        initialData: initialData6,
        placeHolderWidget: placeHolderWidget,
        errorWidget: errorWidget,
        widget: (data6) => widget(data1, data2, data3, data4, data5, data6),
      ),
    );
  }
}
