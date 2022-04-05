/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Ingredients type in your schema. */
@immutable
class Ingredients extends Model {
  static const classType = const _IngredientsModelType();
  final String id;
  final String? _name;
  final List<String>? _ingredients;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _recipeIngredientsId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get ingredients {
    return _ingredients;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get recipeIngredientsId {
    return _recipeIngredientsId;
  }
  
  const Ingredients._internal({required this.id, required name, ingredients, createdAt, updatedAt, recipeIngredientsId}): _name = name, _ingredients = ingredients, _createdAt = createdAt, _updatedAt = updatedAt, _recipeIngredientsId = recipeIngredientsId;
  
  factory Ingredients({String? id, required String name, List<String>? ingredients, String? recipeIngredientsId}) {
    return Ingredients._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      ingredients: ingredients != null ? List<String>.unmodifiable(ingredients) : ingredients,
      recipeIngredientsId: recipeIngredientsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ingredients &&
      id == other.id &&
      _name == other._name &&
      DeepCollectionEquality().equals(_ingredients, other._ingredients) &&
      _recipeIngredientsId == other._recipeIngredientsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Ingredients {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("ingredients=" + (_ingredients != null ? _ingredients!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("recipeIngredientsId=" + "$_recipeIngredientsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ingredients copyWith({String? id, String? name, List<String>? ingredients, String? recipeIngredientsId}) {
    return Ingredients._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      recipeIngredientsId: recipeIngredientsId ?? this.recipeIngredientsId);
  }
  
  Ingredients.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _ingredients = json['ingredients']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _recipeIngredientsId = json['recipeIngredientsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'ingredients': _ingredients, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'recipeIngredientsId': _recipeIngredientsId
  };

  static final QueryField ID = QueryField(fieldName: "ingredients.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField INGREDIENTS = QueryField(fieldName: "ingredients");
  static final QueryField RECIPEINGREDIENTSID = QueryField(fieldName: "recipeIngredientsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ingredients";
    modelSchemaDefinition.pluralName = "Ingredients";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ingredients.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ingredients.INGREDIENTS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ingredients.RECIPEINGREDIENTSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _IngredientsModelType extends ModelType<Ingredients> {
  const _IngredientsModelType();
  
  @override
  Ingredients fromJson(Map<String, dynamic> jsonData) {
    return Ingredients.fromJson(jsonData);
  }
}