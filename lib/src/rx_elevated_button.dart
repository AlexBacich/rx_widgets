import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

/// A reimplementation of a  `ElevatedButton` where the `onPressed` is replaced with `rxCommand`
/// so the button gets disabled if the `rxCommand` has the `canExecute` set to `false` or when it is executing
class RxElevatedButton extends StatelessWidget {
  RxElevatedButton({
    Key? key,
    required this.rxCommand,
    this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
  }) : super(key: key);

  final RxCommand<BuildContext, void> rxCommand;
  final Clip clipBehavior = Clip.none;
  final Widget? child;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final WidgetStatesController? statesController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: rxCommand.canExecute,
      builder: (context, snapshot) => ElevatedButton(
        key: key,
        onPressed: snapshot.hasData ? () => rxCommand() : null,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        statesController: statesController,
        child: child,
      ),
    );
  }
}
