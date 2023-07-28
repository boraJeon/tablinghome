import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablinghome/model/homemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double horizontalPadding = 20;

  final strawberryImgPath = 'assets/img/strawberry.png';

  bool isLocationAuth = false;

  final bannerList = [
    {"title": "FirstBanner", "color": 0xffff9900},
    {"title": "2. SecondBanner", "color": 0xff2e65e6},
    {"title": "ThirdBanner", "color": 0xffff0000}
  ];

  late Future<List<HomeModel>> homeModelList = getHomeList();

  // late List<HomeModel> homeModelList = <HomeModel>[];
  Future<List<HomeModel>> getHomeList() async {
    List<HomeModel> list = [];
    final routeFromJsonFile =
        await rootBundle.loadString('assets/json/home.json');

    List<dynamic> listFromJson = jsonDecode(routeFromJsonFile);
    list = listFromJson.map((e) => HomeModel.fromJson(e)).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return
        // 첫번째 배너영역을 ListBuilder를 바로 추가해보려고 했는데 뭔가 이상함..
        // 일단 Column으로 영역을 나눠봐야겠다
        SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 45,
      ),
      child: Column(
        children: [
          // 1. 처음에 적용했을땐 적용되지않고, debug창 call_stack에서 화려한 로그들이 발생했다.
          //    pause 처리되서 멈춘것처럼 동작하지않아 vscode를 껏다 켰는데 갑자기 잘됨
          // 2. ListView를 SizedBox로 감싸지 않으면 에러가 발생한다..!, 영역 설정 관련 문제인걸까 높이를 알수 없으니
          // 3. width, heigt는 어디에 줘야하는거지? 둘다 줘야하나 ㄷㄷ
          SizedBox(
              height: 100,
              // 무한스크롤을 위해 페이지컨트롤러를 추가해봤다.
              // 자동스크롤도 적용하고싶엇는데, 컨트롤에서 기본설정으로 제공해주지않는다 아쉽..
              // 다른거 없나..  검색하면 야매로 하는방법만 나온다 (하기싫다//)
              child: PageView.builder(
                controller: PageController(initialPage: 300),
                itemBuilder: (context, index) {
                  var data = bannerList[index % 3];
                  return BannerWidget(
                    title: data["title"].toString(),
                    backgroundColor: Color(
                      data["color"].hashCode,
                    ),
                  );
                },
              )
              //  ListView.builder(
              //   itemCount: 3,
              //   itemBuilder: (context, index) {
              //     return BannerWidget(
              //       title: bannerList[index],
              //       backgroundColor: Colors.blue.shade600,
              //     );
              //   },
              //   scrollDirection: Axis.horizontal,
              // ),
              ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "원격줄서기 인기매장 BEST",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                // const SizedBox(
                //   height: 3,
                // ),
                // 왜 위아래 두개의 위젯은 magin이 이렇게 있는것일까
                Row(
                  children: [
                    const Text(
                      "서울 남부",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        isLocationAuth = !isLocationAuth;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: Colors.blueGrey.shade300,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  Row(
                    children: [
                      GridWidget(
                        title: "전체",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "서울",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "경기",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GridWidget(
                        title: "강원",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "인천",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "세종",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GridWidget(
                        title: "충청도",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "경상도",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GridWidget(
                        title: "전라도",
                      ),
                    ],
                  )
                ],
              )
              // 1. 그리드 영역이 스크롤 처리되지않도록 height 어떻게 적용하지,,
              // 2. 부모의 height 고정값을 빼면 에러가 발생
              // 3. 그리드에서 row/column 조합으로 변경
              ),
          const SizedBox(
            height: 22,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Container(
              // 이미지 넣는거 검색해봄
              // 나는 왜 이미지박스를 안쓰고 컨테이너를 썻는가 (이게 맞나)
              // assets/images/폴더에 이미지를 넣었는데 로드가 안됨
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/img/packing_order.png'),
                  fit: BoxFit.fill,
                ),
              ),
              height: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            height: 10,
          ),
          isLocationAuth
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "주변 맛집 다 모여라!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      24,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    )),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 15,
                                      color: Colors.red.shade400,
                                    ),
                                    const Text(
                                      "타임세일",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      24,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    )),
                                padding: const EdgeInsets.all(8),
                                child: const Row(
                                  children: [
                                    Text(
                                      "가까운 순",
                                    ),
                                    Icon(Icons.keyboard_arrow_down_sharp),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      24,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    )),
                                padding: const EdgeInsets.all(8),
                                child: const Row(
                                  children: [
                                    Text(
                                      "전체 거리",
                                    ),
                                    Icon(Icons.keyboard_arrow_down_sharp),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder(
                            future: homeModelList,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    physics: const ScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var homeModel = snapshot.data![index];
                                      print(snapshot.data!.length);
                                      return SizedBox(
                                          height: 120,
                                          child: ListCard(
                                              horizontalPadding:
                                                  horizontalPadding,
                                              homeData: homeModel));
                                    },
                                  ),
                                );
                              }
                              return const Text(
                                "emptyView",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  // alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Icon(
                        Icons.place_rounded,
                        size: 40,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "위치 정보 이용 권한을 허용하시면 \n내 주변의 다양한 맛집을 볼 수 있어요",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          isLocationAuth = !isLocationAuth;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            "허용하기",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

          // 리스트뷰 추가하니깐 또 에러남..
          // 근데 container에 height 추가하니깐 괜찮아짐..
          // 원인을 모르겠음
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final HomeModel homeData;

  const ListCard({
    super.key,
    required this.horizontalPadding,
    required this.homeData,
  });

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          // horizontal: horizontalPadding,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                // 어디는 이 옵션을 안써도 되는데 왜 여긴 써야하지?
                // 차이점을 모르겠다.
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                  8,
                )),
                width: 100,
                height: 100,
                child: Image.network(
                  homeData.thumbUrl,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        8,
                      ),
                      bottomLeft: Radius.circular(
                        8,
                      ),
                    ),
                  ),
                  child: Text(
                    "대기 ${homeData.waitingCount}명",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // 겹치게 하는거 어떻게 하지..?
          // stack 위젯!

          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeData.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 17,
                    color: Colors.yellow.shade600,
                  ),
                  Text("${homeData.rating} (${homeData.reviewCount})"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "한식 - 요약주소1 - 28.98Km",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  Image(
                    width: 48,
                    height: 20,
                    image: AssetImage('assets/img/tag_reservation.png'),
                  ),
                  Image(
                    width: 48,
                    height: 20,
                    image: AssetImage('assets/img/tag_waiting.png'),
                  ),
                  Image(
                    width: 48,
                    height: 20,
                    image: AssetImage('assets/img/tag_order.png'),
                  ),
                  Image(
                    width: 48,
                    height: 20,
                    image: AssetImage('assets/img/tag_takeout.png'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  final String title;

  const GridWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
      width: 100,
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 10,
          )
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const BannerWidget({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
