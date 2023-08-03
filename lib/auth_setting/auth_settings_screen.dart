import 'package:flutter/material.dart';
import 'package:tablinghome/widget/TablingAppBar.dart';

class AuthSettingsScreen extends StatelessWidget {
  const AuthSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TablingAppBar(
        title: "접근 권한 설정",
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  '휴대폰 설정 앱 > 테이블링 > 권한에서\nOFF된 권한을 허용해 주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF525965),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF717171),
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                ),
                child: const Text(
                  "설정 바로 가기>",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "위치 권한",
                        style: TextStyle(
                          color: Color(0xFF11181C),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "OFF",
                        style: TextStyle(
                          color: Color(0xFF525965),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Text(
                    '현재 위치 기반으로 매장 추천 및 탐색을 하기 위해 위치 접근 권한이 필요합니다.',
                    style: TextStyle(
                      color: Color(0xFF878C97),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "카메라 권한",
                        style: TextStyle(
                          color: Color(0xFF11181C),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "ON",
                        style: TextStyle(
                          color: Color(0xFF525965),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Text(
                    '리뷰 작성 시 사진 업로드를 위해 카메라 접근 권한이 필요합니다.',
                    style: TextStyle(
                      color: Color(0xFF878C97),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
