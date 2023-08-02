import 'package:flutter/material.dart';
import 'package:tablinghome/widget/AppBarTitleText.dart';
import 'package:tablinghome/widget/SwitchTile.dart';

class MarketingAgreementScreen extends StatelessWidget {
  MarketingAgreementScreen({super.key});
  // 왜 변수 선언하니깐 const 지우라고 하지?
  //Can't define the 'const' constructor because the field 'marketingListData' is initialized with a non-constant value.
  // Try initializing the field to a constant value, or removing the keyword 'const' from the

  // final marketingListData = [
  //   {
  //     "icon": null,
  //     "title": "전체 알림 켜기",
  //   },
  //   {
  //     "icon": Icons.subdirectory_arrow_right_rounded,
  //     "title": "앱 푸쉬",
  //   },
  //   {
  //     "icon": Icons.subdirectory_arrow_right_rounded,
  //     "title": "이메일",
  //   },
  //   {
  //     "icon": Icons.subdirectory_arrow_right_rounded,
  //     "title": "SMS",
  //   },
  // ];

  final marketingListData = [
    {
      "useLeadingIcon": false,
      "title": "전체 알림 켜기",
    },
    {
      "useLeadingIcon": true,
      "title": "앱 푸쉬",
    },
    {
      "useLeadingIcon": true,
      "title": "이메일",
    },
    {
      "useLeadingIcon": true,
      "title": "SMS",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            title: AppBarTitleText(title: "마케팅 알림 수신 동의"),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Color(0xFF969FAC),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "이벤트와 할인 정보를 알려드립니다.",
                    style: TextStyle(
                      color: Color(0xFF6C7582),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: marketingListData.length,
            itemBuilder: (context, index) {
              var title = marketingListData[index]["title"].toString();
              bool useLeadingIcon =
                  marketingListData[index]["useLeadingIcon"] == true
                      ? true
                      : false;

              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 24,
                ),
                child: SwitchTile(
                  useLeadingIcon: useLeadingIcon,
                  title: title,
                  onChangedHandler: (isSelected) {
                    if (isSelected) {}
                  },
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 16,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD7DBDF),
            padding: const EdgeInsets.symmetric(
              // horizontal: 16,
              vertical: 17,
            ),
          ),
          child: const Text(
            "저장",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
