import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ScrollbarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ScrollbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ScrollBarScreen',
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children:
                numbers
                    .map(
                      (e) => renderContainer(
                        color: getRainbowColor(e),
                        index: e,
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required index,
    double? height,
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
