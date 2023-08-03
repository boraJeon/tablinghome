import 'package:flutter/material.dart';
import 'package:tablinghome/auth_setting/auth_settings_screen.dart';

import '../widget/SwitchTile.dart';
import '../widget/TablingAppBar.dart';

class LocationAgreementScreen extends StatelessWidget {
  const LocationAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TablingAppBar(
        title: "위치기반 서비스 이용약관 설정",
      ),
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   backgroundColor: Colors.white,
          //   title: AppBarTitleText(title: "위치기반 서비스 이용약관 설정"),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 24,
              ),
              child: SwitchTile(
                title: "위치기반 서비스 이용약관 동의",
                onChangedHandler: (value) {
                  print("onChangedHandler value");
                },
                useLeadingIcon: false,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '테이블링 위치기반 서비스를 이용하시려면 현재 위치 정보 사용 및 위치기반 서비스 이용약관에 대한 동의가 필요합니다.',
                    style: TextStyle(
                      color: Color(0xFF878C97),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.31,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthSettingsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      '약관 자세히보기',
                      style: TextStyle(
                        color: Color(0xFF090C10),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        // fontStyle: FontStyle.underlin
                      ),
                    ),
                  ),
                  // textBaseline: TextBaseline.alphabetic,
                ],
              ),
            ),
          )
          // const SliverToBoxAdapter(
          //   child: Text(
          //     '약관 자세히보기',
          //     style: TextStyle(
          //       color: Color(0xFF090C10),
          //       fontSize: 13,
          //       fontWeight: FontWeight.w400,
          //       // textBaseline: TextBaseline.alphabetic,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
