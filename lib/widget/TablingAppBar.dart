import 'package:flutter/material.dart';

class TablingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TablingAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // 이 방식보다는 iconTheme를 밖으로 빼고싶다. main.dart로
    // 근데 main.dart에서 AppBar에 iconTheme, backgroundColor만 넣고,
    // 각 화면에서 AppBar를 추가로 넣었더니 앱바가 두개씩 생겼다.
    // > 찾았다. theme 에 있었네!!

    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff0A0C11),
          fontSize: 17,
        ),
      ),
    );
  }

  // AppBar 를 커스텀 하려면 PreferredSizeWidget을 필요로 하고
  // 그걸 사용하려면 width, height 값을 줘야하는데
  // width는 0을 줘도 잘나온다.
  // MediaQuery.of(context).size.width 이걸 쓰고싶지만 context를 알수가 없어 쓸수가 없다.
  // 어떻게 해야하는걸까??
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, 44);
}
