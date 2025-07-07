import 'package:flutter/material.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/custom_scroll_view_screen.dart';
import 'package:scrollable_widgets/screen/grid_view_screen.dart';
import 'package:scrollable_widgets/screen/list_view_screen.dart';
import 'package:scrollable_widgets/screen/refresh_indicator.dart';
import 'package:scrollable_widgets/screen/reorderable_list_view_screen.dart';
import 'package:scrollable_widgets/screen/scrollbar_screen.dart';
import 'package:scrollable_widgets/screen/single_child_scroll_view_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<({WidgetBuilder builder, String name})> screens = [
    (
      builder: (_) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollViewScreen',
    ),
    (
      builder: (_) => ListViewScreen(),
      name: 'ListViewScreen',
    ),
    (
      builder: (_) => GridViewScreen(),
      name: 'GridViewScreen',
    ),
    (
      builder: (_) => ReorderableListViewScreen(),
      name: 'ReorderableListViewScreen',
    ),
    (
      builder: (_) => CustomScrollViewScreen(),
      name: 'CustomScrollViewScreen',
    ),
    (
      builder: (_) => ScrollbarScreen(),
      name: 'ScrollbarScreen',
    ),
    (
      builder: (_) => RefreshIndicatorScreen(),
      name: 'RefreshIndicatorScreen',
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
                screens
                    .map(
                      (screen) => ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: screen.builder),
                          );
                        },
                        child: Text(screen.name),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
