import 'package:fitness_app/design_system/colors/primary_app_colors.model.dart';

class AppColors {
  const AppColors({required this.primaryAppColors});
  final PrimaryAppColors primaryAppColors;

  factory AppColors.light() {
    return AppColors(primaryAppColors: PrimaryAppColors.light());
  }

  factory AppColors.dark() {
    return AppColors(primaryAppColors: PrimaryAppColors.dark());
  }
}
