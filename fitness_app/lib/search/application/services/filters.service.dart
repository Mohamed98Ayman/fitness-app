import 'dart:async';

import 'package:fitness_app/network/application/services/http.service.dart';
import 'package:fitness_app/search/data/remote/filters.repo.dart';
import 'package:fitness_app/search/domain/models/body_part_filter.dto.dart';
import 'package:fitness_app/search/domain/models/equipment_filter.dto.dart';
import 'package:fitness_app/search/domain/models/target_filter.dto.dart';

class FiltersService {
  const FiltersService._();

  static Future<List<TargetFilterDto>> getTargetList() async =>
      await HttpClientService.sendRequest(FiltersApis.getTargetList());

  static Future<List<BodyPartDto>> getBodyPartList() async =>
      await HttpClientService.sendRequest(FiltersApis.getBodyPartList());

  static Future<List<EquipmentFilterDto>> getEquipmentList() async =>
      await HttpClientService.sendRequest(FiltersApis.getEquipmentList());
}
