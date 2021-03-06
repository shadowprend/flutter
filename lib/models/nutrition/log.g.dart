// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'id',
    'plan',
    'datetime',
    'ingredient',
    'weight_unit',
    'amount'
  ]);
  return Log(
    id: json['id'] as int,
    ingredientId: json['ingredient'] as int,
    ingredientObj: json['ingredientObj'] == null
        ? null
        : Ingredient.fromJson(json['ingredientObj'] as Map<String, dynamic>),
    weightUnit: json['weight_unit'] as int,
    weightUnitObj: json['weightUnitObj'] == null
        ? null
        : IngredientWeightUnit.fromJson(
            json['weightUnitObj'] as Map<String, dynamic>),
    amount: toNum(json['amount'] as String),
    planId: json['plan'] as int,
    datetime: json['datetime'] == null
        ? null
        : DateTime.parse(json['datetime'] as String),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'id': instance.id,
      'plan': instance.planId,
      'datetime': instance.datetime?.toIso8601String(),
      'comment': instance.comment,
      'ingredient': instance.ingredientId,
      'ingredientObj': instance.ingredientObj,
      'weight_unit': instance.weightUnit,
      'weightUnitObj': instance.weightUnitObj,
      'amount': instance.amount,
    };
