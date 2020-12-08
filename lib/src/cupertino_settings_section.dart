import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'colors.dart';
import 'defines.dart';

class CupertinoSettingsSection extends StatelessWidget {
  const CupertinoSettingsSection(
    this.items, {
    this.header,
    this.headerPadding = defaultTitlePadding,
    this.footer,
  })  : assert(items != null),
        assert(headerPadding != null);

  final List<Widget> items;

  final Widget header;
  final EdgeInsetsGeometry headerPadding;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = [];
    if (header != null) {
      columnChildren.add(DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.inactiveGray,
          fontSize: 13.5,
          letterSpacing: -0.5,
        ),
        child: Padding(
          padding: headerPadding,
          child: header,
        ),
      ));
    }

    List<Widget> itemsWithDividers = [];
    for (int i = 0; i < items.length; i++) {
      if (i < items.length - 1) {
        itemsWithDividers.add(items[i]);
      } else {
        itemsWithDividers.add(items[i]);
      }
    }

    columnChildren.add(
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? CupertinoColors.white
              : iosTileDarkColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: itemsWithDividers,
        ),
      ),
    );

    if (footer != null) {
      columnChildren.add(DefaultTextStyle(
        style: TextStyle(
          color: groupSubtitle,
          fontSize: 13.0,
          letterSpacing: -0.08,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 7.5,
          ),
          child: footer,
        ),
      ));
    }

    return Padding(
      padding: EdgeInsets.only(
        top: header == null ? 0.0 : 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }
}
