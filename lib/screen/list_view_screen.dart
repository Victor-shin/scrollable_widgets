import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderSeparated(),
    );
  }

  // 3
  // 2 + 중간 중간에 추가할 위젯 넣을 수 있음.
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        // 5개의 item마다 배너 보여주기(*)
        if (index == 0 || index % 5 != 0) {
          return const SizedBox.shrink();
        }
        return renderContainer(color: Colors.black, index: index, height: 100);
      },
    );
  }

  // 2
  // 보이는 것만 그린다. 효율적으로 메모리를 사용하는 방식 ListView.builder
  Widget renderBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  // 1
  // 한방에 다 드린다. performance가 안좋을 수 있다.
  Widget renderDefault() {
    return ListView(
      children:
          numbers
              .map(
                (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length],
                  index: e,
                ),
              )
              .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required index,
    double? height
  }) {
    print(index);

    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
