import 'package:fitness_app/search/application/services/filters.service.dart';
import 'package:fitness_app/search/domain/models/body_part_filter.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyPartController = FutureProvider<List<BodyPartDto>>(
  (ref) => FiltersService.getBodyPartList(),
);
