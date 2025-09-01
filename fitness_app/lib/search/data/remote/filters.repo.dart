import 'package:fitness_app/network/domain/enums/request_method.enum.dart';
import 'package:fitness_app/network/domain/models/endpoint_signature.model.dart';
import 'package:fitness_app/search/domain/models/body_part_filter.dto.dart';
import 'package:fitness_app/search/domain/models/equipment_filter.dto.dart';
import 'package:fitness_app/search/domain/models/target_filter.dto.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class FiltersApis {
  const FiltersApis._();

  static const String _basePathParam = '/exercises';

  static EndpointSignature getTargetList() => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/targetList',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data.map((target) => TargetFilterDto(targetId: target)).toList();
      }
      return List<TargetFilterDto>.empty();
    },
  );

  static EndpointSignature getEquipmentList() => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/equipmentList',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((equipment) => EquipmentFilterDto(equipmentId: equipment))
            .toList();
      }
      return List<TargetFilterDto>.empty();
    },
  );

  static EndpointSignature getBodyPartList() => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/bodyPartList',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((bodyPart) => BodyPartDto(bodyPartId: bodyPart))
            .toList();
      }
      return List<BodyPartDto>.empty();
    },
  );
}
