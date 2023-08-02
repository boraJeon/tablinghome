import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final Function(bool) onChangedHandler;
  final bool useLeadingIcon;
  final Widget? leadingIcon;

  const SwitchTile({
    super.key,
    required this.title,
    required this.onChangedHandler,
    required this.useLeadingIcon,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget = leadingIcon;
    iconWidget ??= const SizedBox();

    // switch만 trailing 정렬을 어떻게 하는지 모르겠다 ㅠㅠ
    return Row(
      children: [
        // iconWidget,
        useLeadingIcon
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
          title,
          style: const TextStyle(
            color: Color(0xFF2E3137),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Container(
          // iOS / android 기기구분하는 로직 추가
          alignment: Alignment.topRight,
          child: defaultTargetPlatform == TargetPlatform.iOS
              ? CupertinoSwitch(value: false, onChanged: onChangedHandler)
              : Switch(value: false, onChanged: onChangedHandler),
        ),
      ],
    );
  }
}
