import 'package:flutter/material.dart';

enum PaddingLevel { none, small, medium, large }

class AppScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool scrollable;
  final Color? backgroundColor;
  final EdgeInsets? customPadding;
  final PaddingLevel paddingLevel;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;

  const AppScaffoldWidget({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.customPadding,
    this.scrollable = false,
    this.paddingLevel = PaddingLevel.medium,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
  });

  EdgeInsets _getPadding() {
    if (customPadding != null) return customPadding!;
    switch (paddingLevel) {
      case PaddingLevel.none:
        return EdgeInsets.zero;
      case PaddingLevel.small:
        return const EdgeInsets.all(8);
      case PaddingLevel.medium:
        return const EdgeInsets.all(16);
      case PaddingLevel.large:
        return const EdgeInsets.all(24);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: _getPadding(),
      child: body ?? const SizedBox(),
    );

    // Always wrap content with SafeArea
    content = SafeArea(
      child: scrollable
          ? SingleChildScrollView(child: content)
          : content,
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: content,
    );
  }
}
