import 'package:fitness_app/search/application/services/filters.service.dart';
import 'package:fitness_app/search/domain/models/equipment_filter.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final equipmentController = FutureProvider<List<EquipmentFilterDto>>(
  (ref) => FiltersService.getEquipmentList(),
);
