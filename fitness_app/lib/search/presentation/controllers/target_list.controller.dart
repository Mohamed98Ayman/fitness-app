import 'package:fitness_app/search/application/services/filters.service.dart';

import 'package:fitness_app/search/domain/models/target_filter.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final targetController = FutureProvider<List<TargetFilterDto>>(
  (ref) => FiltersService.getTargetList(),
);
