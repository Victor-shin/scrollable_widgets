import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

/// 기본은 스크롤이 없지만, 화면을 넘어갈 경우 스크롤 기능이 생긴다.
class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({super.key});

  /// SingleChildScrollView 는 모두 다 만들어버린다. performance가 중요할 경우 주의할 것

  @override
  Widget build(BuildContext context) {
    print(numbers);

    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPerformance(),
    );
  }

  // 5
  // SingleChildScrollView 퍼포먼스
  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children:
            numbers
                .map(
                  (e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length],
                    index: e
                  ),
                )
                .toList(),
      ),
    );
  }

  // 4
  // 여러가지 Phydics
  Widget renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      // AlwaysScrollableScrollPhysics - 스크롤 됨
      // BouncingScrollPhysics - iOS 스타일
      // ClampingScrollPhysics - android 스타일
      physics: ClampingScrollPhysics(),
      child: Column(
        children:
            rainbowColors
                .map<Widget>((e) => renderContainer(color: e))
                .toList(),
      ),
    );
  }

  // 3
  // 스크롤이 잘리지 않게 한다.
  SingleChildScrollView renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [renderContainer(color: Colors.black)]),
    );
  }

  // 2
  // 화면을 넘어가지 않아도 스크롤 되게하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [renderContainer(color: Colors.black)]),
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children:
            rainbowColors
                .map<Widget>((e) => renderContainer(color: e))
                .toList(),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if(index != null) {
      print(index);
    }
    return Container(height: 300, color: color);
  }
}
