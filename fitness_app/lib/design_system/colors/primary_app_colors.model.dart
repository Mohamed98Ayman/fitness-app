import 'dart:ui';

class PrimaryAppColors {
  final Color x000000;
  final Color x1D1D1D;
  final Color x0A0708;
  final Color xF5F5F5;
  final Color xFFFFFF;

  const PrimaryAppColors({
    required this.x000000,
    required this.x1D1D1D,
    required this.x0A0708,
    required this.xF5F5F5,
    required this.xFFFFFF,
  });

  factory PrimaryAppColors.light() {
    return PrimaryAppColors(
      x000000: const Color(0xff000000),
      x1D1D1D: const Color(0xff1D1D1D),
      x0A0708: const Color(0xff0A0708),
      xF5F5F5: const Color(0xffF5F5F5),
      xFFFFFF: const Color(0xffFFFFFF),
    );
  }

  factory PrimaryAppColors.dark() {
    return PrimaryAppColors(
      x000000: const Color(0xff000000),
      x1D1D1D: const Color(0xff1D1D1D),
      x0A0708: const Color(0xff0A0708),
      xF5F5F5: const Color(0xffF5F5F5),
      xFFFFFF: const Color(0xffFFFFFF),
    );
  }
}
