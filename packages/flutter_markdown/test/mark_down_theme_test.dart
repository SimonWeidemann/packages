// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => defineTests();

void defineTests() {
  testWidgets('uses theme', (WidgetTester widgetTester) async {
    const String data = 'www.flutter.com';
    const TextStyle textStyle = TextStyle(color: Colors.blueGrey);
    final MarkdownStyleSheet sheet = MarkdownStyleSheet(a: textStyle);

    await widgetTester.pumpWidget(
      _TestApp(
        sheet,
        data,
        const MarkdownBody(data: 'www.flutter.com'),
      ),
    );
    final Finder markDown = find.text(data);
    expect(markDown, findsOne);
    final Text text = widgetTester.widget<Text>(markDown);
    expect(text.textSpan?.style?.color, textStyle.color);
  });

  testWidgets('uses widget styleSheet', (WidgetTester widgetTester) async {
    const String data = 'www.flutter.com';
    const TextStyle textStyle = TextStyle(color: Colors.blueGrey);
    final MarkdownStyleSheet theme = MarkdownStyleSheet(a: textStyle);
    const TextStyle customStyle = TextStyle(color: Colors.deepPurple);
    final MarkdownStyleSheet widgetTheme = MarkdownStyleSheet(
      a: customStyle,
    );

    await widgetTester.pumpWidget(
      _TestApp(
        theme,
        data,
        MarkdownBody(data: 'www.flutter.com', styleSheet: widgetTheme),
      ),
    );
    final Finder markDown = find.text(data);
    expect(markDown, findsOne);
    final Text text = widgetTester.widget<Text>(markDown);
    expect(text.textSpan?.style?.color, customStyle.color);
  });

  test('copyWith copies the correct values', () {
    final MarkdownStyleSheet original = MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: const TextStyle(color: Colors.black),
    );

    final MarkdownStyleSheet copy = original.copyWith(
      a: const TextStyle(color: Colors.red),
      p: const TextStyle(color: Colors.grey),
      textAlign: WrapAlignment.end,
    );

    expect(copy.a!.color, Colors.red);
    expect(copy.p!.color, Colors.grey);
    expect(copy.textAlign, WrapAlignment.end);
  });

  test('lerp interpolates values correctly', () {
    final MarkdownStyleSheet theme1 = MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: const TextStyle(color: Colors.black),
      pPadding: const EdgeInsets.all(10),
      code: const TextStyle(color: Colors.green),
      h1: const TextStyle(fontSize: 30),
      h1Padding: const EdgeInsets.all(15),
      h2: const TextStyle(fontSize: 25),
      h2Padding: const EdgeInsets.all(12),
      h3: const TextStyle(fontSize: 20),
      h3Padding: const EdgeInsets.all(10),
      h4: const TextStyle(fontSize: 18),
      h4Padding: const EdgeInsets.all(8),
      h5: const TextStyle(fontSize: 16),
      h5Padding: const EdgeInsets.all(6),
      h6: const TextStyle(fontSize: 14),
      h6Padding: const EdgeInsets.all(4),
      em: const TextStyle(fontStyle: FontStyle.italic),
      strong: const TextStyle(fontWeight: FontWeight.bold),
      del: const TextStyle(decoration: TextDecoration.lineThrough),
      blockquote: const TextStyle(color: Colors.purple),
      img: const TextStyle(color: Colors.orange),
      checkbox: const TextStyle(color: Colors.red),
      blockSpacing: 20,
      listIndent: 10,
      listBullet: const TextStyle(color: Colors.teal),
      listBulletPadding: const EdgeInsets.all(5),
      tableHead: const TextStyle(color: Colors.brown),
      tableBody: const TextStyle(color: Colors.cyan),
      tableHeadAlign: TextAlign.center,
      tableBorder: TableBorder.all(),
      tableColumnWidth: const FixedColumnWidth(100),
      tableCellsPadding: const EdgeInsets.all(5),
      tableCellsDecoration: const BoxDecoration(color: Colors.yellow),
      blockquotePadding: const EdgeInsets.all(10),
      blockquoteDecoration: const BoxDecoration(color: Colors.grey),
      codeblockPadding: const EdgeInsets.all(10),
      codeblockDecoration: const BoxDecoration(color: Colors.blue),
      horizontalRuleDecoration: const BoxDecoration(color: Colors.red),
      textAlign: WrapAlignment.center,
      h1Align: WrapAlignment.center,
      h2Align: WrapAlignment.center,
      h3Align: WrapAlignment.center,
      h4Align: WrapAlignment.center,
      h5Align: WrapAlignment.center,
      h6Align: WrapAlignment.center,
      unorderedListAlign: WrapAlignment.center,
      orderedListAlign: WrapAlignment.center,
      blockquoteAlign: WrapAlignment.center,
      codeblockAlign: WrapAlignment.center,
      textScaler: TextScaler.noScaling,
      superscriptFontFeatureTag: 'sups',
    );

    final MarkdownStyleSheet theme2 = MarkdownStyleSheet(
      a: const TextStyle(color: Colors.red),
      p: const TextStyle(color: Colors.grey),
      pPadding: const EdgeInsets.all(20),
      code: const TextStyle(color: Colors.blue),
      h1: const TextStyle(fontSize: 40),
      h1Padding: const EdgeInsets.all(25),
      h2: const TextStyle(fontSize: 35),
      h2Padding: const EdgeInsets.all(22),
      h3: const TextStyle(fontSize: 30),
      h3Padding: const EdgeInsets.all(20),
      h4: const TextStyle(fontSize: 28),
      h4Padding: const EdgeInsets.all(18),
      h5: const TextStyle(fontSize: 26),
      h5Padding: const EdgeInsets.all(16),
      h6: const TextStyle(fontSize: 24),
      h6Padding: const EdgeInsets.all(14),
      em: const TextStyle(fontStyle: FontStyle.normal),
      strong: const TextStyle(fontWeight: FontWeight.w300),
      del: const TextStyle(decoration: TextDecoration.none),
      blockquote: const TextStyle(color: Colors.brown),
      img: const TextStyle(color: Colors.pink),
      checkbox: const TextStyle(color: Colors.yellow),
      blockSpacing: 40,
      listIndent: 20,
      listBullet: const TextStyle(color: Colors.indigo),
      listBulletPadding: const EdgeInsets.all(10),
      tableHead: const TextStyle(color: Colors.black),
      tableBody: const TextStyle(color: Colors.white),
      tableHeadAlign: TextAlign.left,
      tableBorder: TableBorder.all(color: Colors.white),
      tableColumnWidth: const FixedColumnWidth(200),
      tableCellsPadding: const EdgeInsets.all(10),
      tableCellsDecoration: const BoxDecoration(color: Colors.green),
      tableVerticalAlignment: TableCellVerticalAlignment.bottom,
      blockquotePadding: const EdgeInsets.all(20),
      blockquoteDecoration: const BoxDecoration(color: Colors.black),
      codeblockPadding: const EdgeInsets.all(20),
      codeblockDecoration: const BoxDecoration(color: Colors.red),
      horizontalRuleDecoration: const BoxDecoration(color: Colors.green),
      textAlign: WrapAlignment.end,
      h1Align: WrapAlignment.end,
      h2Align: WrapAlignment.end,
      h3Align: WrapAlignment.end,
      h4Align: WrapAlignment.end,
      h5Align: WrapAlignment.end,
      h6Align: WrapAlignment.end,
      unorderedListAlign: WrapAlignment.end,
      orderedListAlign: WrapAlignment.end,
      blockquoteAlign: WrapAlignment.end,
      codeblockAlign: WrapAlignment.end,
      textScaler: const TextScaler.linear(2),
      superscriptFontFeatureTag: 'subs',
    );

    final MarkdownStyleSheet lerpedTheme = theme1.lerp(theme2, 0.5);

    expect(
      lerpedTheme.a!.color,
      Color.lerp(Colors.blue, Colors.red, 0.5),
    );
    expect(
      lerpedTheme.p!.color,
      Color.lerp(Colors.black, Colors.grey, 0.5),
    );
    expect(
      lerpedTheme.pPadding,
      EdgeInsets.lerp(const EdgeInsets.all(10), const EdgeInsets.all(20), 0.5),
    );
    expect(
      lerpedTheme.code!.color,
      Color.lerp(Colors.green, Colors.blue, 0.5),
    );
    expect(
      lerpedTheme.h1!.fontSize,
      lerpDouble(30, 40, 0.5),
    );
    expect(
      lerpedTheme.h1Padding,
      EdgeInsets.lerp(const EdgeInsets.all(15), const EdgeInsets.all(25), 0.5),
    );
    expect(
      lerpedTheme.h2!.fontSize,
      lerpDouble(25, 35, 0.5),
    );
    expect(
      lerpedTheme.h2Padding,
      EdgeInsets.lerp(const EdgeInsets.all(12), const EdgeInsets.all(22), 0.5),
    );
    expect(
      lerpedTheme.h3!.fontSize,
      lerpDouble(20, 30, 0.5),
    );
    expect(
      lerpedTheme.h3Padding,
      EdgeInsets.lerp(const EdgeInsets.all(10), const EdgeInsets.all(20), 0.5),
    );
    expect(
      lerpedTheme.h4!.fontSize,
      lerpDouble(18, 28, 0.5),
    );
    expect(
      lerpedTheme.h4Padding,
      EdgeInsets.lerp(const EdgeInsets.all(8), const EdgeInsets.all(18), 0.5),
    );
    expect(
      lerpedTheme.h5!.fontSize,
      lerpDouble(16, 26, 0.5),
    );
    expect(
      lerpedTheme.h5Padding,
      EdgeInsets.lerp(const EdgeInsets.all(6), const EdgeInsets.all(16), 0.5),
    );
    expect(
      lerpedTheme.h6!.fontSize,
      lerpDouble(14, 24, 0.5),
    );
    expect(
      lerpedTheme.h6Padding,
      EdgeInsets.lerp(const EdgeInsets.all(4), const EdgeInsets.all(14), 0.5),
    );
    expect(
      lerpedTheme.em!.fontStyle,
      FontStyle.normal,
    );
    expect(
      lerpedTheme.strong!.fontWeight,
      FontWeight.w500,
    );
    expect(
      lerpedTheme.del!.decoration,
      TextDecoration.none,
    );
    expect(
      lerpedTheme.blockquote!.color,
      Color.lerp(Colors.purple, Colors.brown, 0.5),
    );
    expect(
      lerpedTheme.img!.color,
      Color.lerp(Colors.orange, Colors.pink, 0.5),
    );
    expect(
      lerpedTheme.checkbox!.color,
      Color.lerp(Colors.red, Colors.yellow, 0.5),
    );
    expect(
      lerpedTheme.blockSpacing,
      lerpDouble(20, 40, 0.5),
    );
    expect(
      lerpedTheme.listIndent,
      lerpDouble(10, 20, 0.5),
    );
    expect(
      lerpedTheme.listBullet!.color,
      Color.lerp(Colors.teal, Colors.indigo, 0.5),
    );
    expect(
      lerpedTheme.listBulletPadding,
      EdgeInsets.lerp(const EdgeInsets.all(5), const EdgeInsets.all(10), 0.5),
    );
    expect(
      lerpedTheme.tableHead!.color,
      Color.lerp(Colors.brown, Colors.black, 0.5),
    );
    expect(
      lerpedTheme.tableBody!.color,
      Color.lerp(Colors.cyan, Colors.white, 0.5),
    );
    expect(
      lerpedTheme.tableHeadAlign,
      TextAlign.left,
    );
    expect(
      lerpedTheme.tableBorder,
      TableBorder.lerp(
        TableBorder.all(),
        TableBorder.all(color: Colors.white),
        0.5,
      ),
    );
    expect(
      lerpedTheme.tableColumnWidth,
      const FixedColumnWidth(200),
    );
    expect(
      lerpedTheme.tableCellsPadding,
      EdgeInsets.lerp(const EdgeInsets.all(5), const EdgeInsets.all(10), 0.5),
    );
    expect(
      lerpedTheme.tableCellsDecoration,
      BoxDecoration.lerp(
        const BoxDecoration(color: Colors.yellow),
        const BoxDecoration(color: Colors.green),
        0.5,
      ),
    );
    expect(
      lerpedTheme.tableVerticalAlignment,
      TableCellVerticalAlignment.bottom,
    );
    expect(
      lerpedTheme.blockquotePadding,
      EdgeInsets.lerp(const EdgeInsets.all(10), const EdgeInsets.all(20), 0.5),
    );
    expect(
      lerpedTheme.blockquoteDecoration,
      BoxDecoration.lerp(
        const BoxDecoration(color: Colors.grey),
        const BoxDecoration(color: Colors.black),
        0.5,
      ),
    );
    expect(
      lerpedTheme.codeblockPadding,
      EdgeInsets.lerp(const EdgeInsets.all(10), const EdgeInsets.all(20), 0.5),
    );
    expect(
      lerpedTheme.codeblockDecoration,
      BoxDecoration.lerp(
        const BoxDecoration(color: Colors.blue),
        const BoxDecoration(color: Colors.red),
        0.5,
      ),
    );
    expect(
      lerpedTheme.horizontalRuleDecoration,
      BoxDecoration.lerp(
        const BoxDecoration(color: Colors.red),
        const BoxDecoration(color: Colors.green),
        0.5,
      ),
    );
    expect(lerpedTheme.textAlign, WrapAlignment.end);
    expect(lerpedTheme.h1Align, WrapAlignment.end);
    expect(lerpedTheme.h2Align, WrapAlignment.end);
    expect(lerpedTheme.h3Align, WrapAlignment.end);
    expect(lerpedTheme.h4Align, WrapAlignment.end);
    expect(lerpedTheme.h5Align, WrapAlignment.end);
    expect(lerpedTheme.h6Align, WrapAlignment.end);
    expect(
      lerpedTheme.unorderedListAlign,
      WrapAlignment.end,
    );
    expect(
      lerpedTheme.orderedListAlign,
      WrapAlignment.end,
    );
    expect(
      lerpedTheme.blockquoteAlign,
      WrapAlignment.end,
    );
    expect(
      lerpedTheme.codeblockAlign,
      WrapAlignment.end,
    );
    expect(
      lerpedTheme.textScaler,
      const TextScaler.linear(2),
    );
    expect(lerpedTheme.superscriptFontFeatureTag, 'subs');
  });

  test('lerp with null other returns original theme', () {
    final MarkdownStyleSheet theme = MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: const TextStyle(color: Colors.black),
    );

    final MarkdownStyleSheet lerpedTheme = theme.lerp(null, 0.5);

    expect(lerpedTheme, theme);
  });

  test('copyWith maintains other values', () {
    final MarkdownStyleSheet original = MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: const TextStyle(color: Colors.black),
    );

    final MarkdownStyleSheet copy = original.copyWith(
      a: const TextStyle(color: Colors.red),
    );

    expect(copy.a!.color, Colors.red);
    expect(copy.p!.color, Colors.black);
    expect(copy.textAlign, WrapAlignment.start);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp(this.sheet, this.data, this.markdown);

  final MarkdownStyleSheet sheet;
  final String data;
  final MarkdownWidget markdown;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdown Demos',
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[sheet],
      ),
      home: Center(
        child: markdown,
      ),
    );
  }
}
