import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SwitchTile extends StatefulWidget {
  final String title;
  final Function(bool) onChangedHandler;
  final bool useLeadingIcon;
  final Widget? leadingIcon;
  final bool isSelected;

  late bool switchSelected = isSelected;

  SwitchTile({
    super.key,
    required this.title,
    required this.onChangedHandler,
    required this.useLeadingIcon,
    required this.isSelected,
    this.leadingIcon,
  });

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  @override
  Widget build(BuildContext context) {
    Widget? iconWidget = widget.leadingIcon;
    iconWidget ??= const SizedBox();

    print("switchSelected $widget.switchSelected");

    // switch만 trailing 정렬을 어떻게 하는지 모르겠다 ㅠㅠ
    return Row(
      children: [
        // iconWidget,
        widget.useLeadingIcon
            ?
            // const Icon(
            //     Icons.subdirectory_arrow_right_rounded,
            //   )
            const Image(
                width: 20,
                height: 20,
                image: AssetImage('assets/img/subarrow.png'),
              )
            : const SizedBox(),
        const SizedBox(
          width: 6,
        ),
        Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFF2E3137),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Container(
          // iOS / android 기기구분하는 로직 추가
          // flutter_platform_widgets 추가

          // alignment: Alignment.topRight,
          // child: defaultTargetPlatform == TargetPlatform.iOS
          //     ? CupertinoSwitch(
          //         value: widget.switchSelected,
          //         onChanged: (value) {
          //           widget.onChangedHandler(value);
          //           setState(() {
          //             widget.switchSelected = value;
          //           });
          //         },
          //       )
          //     : Switch(
          //         value: widget.switchSelected,
          //         onChanged: (value) {
          //           widget.onChangedHandler(value);
          //           setState(() {
          //             widget.switchSelected = value;
          //           });
          //         },
          //       ),
          child: PlatformSwitch(
            value: widget.switchSelected,
            onChanged: (value) {
              widget.onChangedHandler(value);
              setState(() {
                widget.switchSelected = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
