import 'dart:ui';

class PrimaryAppColors {
  final Color x000000;
  final Color x00D6D7;
  final Color x11121A;
  final Color x1A1F28;
  final Color x1A2C43;
  final Color x1B1D24;
  final Color x1D1D1D;
  final Color x22242C;
  final Color x0A0708;
  final Color x8F99A3;
  final Color xC43406;
  final Color xD1D2D2;
  final Color xF5F5F5;
  final Color xFF5C28;
  final Color xFFFFFF;

  const PrimaryAppColors({
    required this.x000000,
    required this.x00D6D7,
    required this.x11121A,
    required this.x1A1F28,
    required this.x1A2C43,
    required this.x1B1D24,
    required this.x1D1D1D,
    required this.x22242C,
    required this.x0A0708,
    required this.x8F99A3,
    required this.xC43406,
    required this.xD1D2D2,
    required this.xF5F5F5,
    required this.xFF5C28,
    required this.xFFFFFF,
  });

  factory PrimaryAppColors.light() {
    return PrimaryAppColors(
      x000000: const Color(0xff000000),
      x00D6D7: const Color(0xff00D6D7),
      x11121A: const Color(0xff11121A),
      x1A1F28: const Color(0xff1A1F28),
      x1A2C43: const Color(0xff1A2C43),
      x1B1D24: const Color(0xff1B1D24),
      x1D1D1D: const Color(0xff1D1D1D),
      x22242C: const Color(0xff22242C),
      x0A0708: const Color(0xff0A0708),
      x8F99A3: const Color(0xff8F99A3),
      xC43406: const Color(0xffC43406),
      xD1D2D2: const Color(0xffD1D2D2),
      xF5F5F5: const Color(0xffF5F5F5),
      xFF5C28: const Color(0xffFF5C28),
      xFFFFFF: const Color(0xffFFFFFF),
    );
  }

  factory PrimaryAppColors.dark() {
    return PrimaryAppColors(
      x000000: const Color(0xff000000),
      x00D6D7: const Color(0xff00D6D7),
      x11121A: const Color(0xff11121A),
      x1A1F28: const Color(0xff1A1F28),
      x1A2C43: const Color(0xff1A2C43),
      x1B1D24: const Color(0xff1B1D24),
      x1D1D1D: const Color(0xff1D1D1D),
      x22242C: const Color(0xff22242C),
      x0A0708: const Color(0xff0A0708),
      x8F99A3: const Color(0xff8F99A3),
      xC43406: const Color(0xffC43406),
      xD1D2D2: const Color(0xffD1D2D2),
      xF5F5F5: const Color(0xffF5F5F5),
      xFF5C28: const Color(0xffFF5C28),
      xFFFFFF: const Color(0xffFFFFFF),
    );
  }
}
