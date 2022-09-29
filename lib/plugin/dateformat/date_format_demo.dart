// ignore_for_file: avoid_print

import 'package:date_format/date_format.dart';

/// uuu解析存在bug，只生成2位
void printAll(DateTime dateTime, {DateLocale locale = const EnglishDateLocale()}) {
  print(formatDate(
      dateTime,
      [
        ' yyyy=',
        yyyy,
        ' yy=',
        yy,
        ' mm=',
        mm,
        ' m=',
        m,
        ' MM=',
        MM,
        ' M=',
        M,
        ' dd=',
        dd,
        ' d=',
        d,
        ' w=',
        w,
        ' W=',
        W,
        ' WW=',
        WW,
        ' DD=',
        DD,
        ' D=',
        D,
        ' HH=',
        HH,
        ' H=',
        H,
        ' hh=',
        hh,
        ' h=',
        h,
        ' am=',
        am,
        ' nn=',
        nn,
        ' n=',
        n,
        ' ss=',
        ss,
        ' s=',
        s,
        ' SSS=',
        SSS,
        ' S=',
        S,
        ' uuu=',
        uuu,
        ' u=',
        u,
        ' z=',
        z,
        ' Z=',
        Z,
      ],
      locale: locale));
}

void printDateLocale(DateTime dateTime, {DateLocale locale = const EnglishDateLocale()}) {
  print("printDateLocale: ${formatDate(dateTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, ' ', MM, ' ', DD, ' ', am], locale: locale)}");
}

void printDate(DateTime dateTime) {
  print("printDate: ${formatDate(dateTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, ' ', z])}");
}

void printDayInYear(DateTime dateTime) {
  print("printDayInYear: ${dayInYear(dateTime)}");
}

void main(List<String> args) {
  // DateTime now = DateTime.now();
  // printDate(now);
  // printDayInYear(now);

  // printDateLocale(now, locale: const EnglishDateLocale());
  // printDateLocale(now, locale: const SimplifiedChineseDateLocale());
  // printDateLocale(now, locale: const KoreanDateLocale());

  DateTime date1 = DateTime(1999, 12, 31, 23, 59, 59, 991, 999);
  DateTime date2 = DateTime(2000, 1, 1, 1, 1, 1, 009, 001);
  printAll(date1, locale: const EnglishDateLocale());
  printAll(date1, locale: const SimplifiedChineseDateLocale());
  printAll(date1, locale: const KoreanDateLocale());
  printAll(date2, locale: const EnglishDateLocale());
  printAll(date2, locale: const SimplifiedChineseDateLocale());
  printAll(date2, locale: const KoreanDateLocale());
}
