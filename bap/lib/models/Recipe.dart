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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Recipe type in your schema. */
@immutable
class Recipe extends Model {
  static const classType = const _RecipeModelType();
  final String id;
  final String? _imageURL;
  final String? _name;
  final String? _author;
  final List<String>? _cuisine;
  final String? _diffulty;
  final int? _servingsize;
  final String? _preptime;
  final String? _cookingtime;
  final List<Ingredients>? _ingredients;
  final List<String>? _directions;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String get imageURL {
    try {
      return _imageURL!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get author {
    return _author;
  }

  List<String>? get cuisine {
    return _cuisine;
  }

  String? get diffulty {
    return _diffulty;
  }

  int get servingsize {
    try {
      return _servingsize!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get preptime {
    try {
      return _preptime!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get cookingtime {
    try {
      return _cookingtime!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<Ingredients>? get ingredients {
    return _ingredients;
  }

  List<String>? get directions {
    return _directions;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Recipe._internal(
      {required this.id,
      required imageURL,
      required name,
      author,
      cuisine,
      diffulty,
      required servingsize,
      required preptime,
      required cookingtime,
      ingredients,
      directions,
      createdAt,
      updatedAt})
      : _imageURL = imageURL,
        _name = name,
        _author = author,
        _cuisine = cuisine,
        _diffulty = diffulty,
        _servingsize = servingsize,
        _preptime = preptime,
        _cookingtime = cookingtime,
        _ingredients = ingredients,
        _directions = directions,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Recipe(
      {String? id,
      required String imageURL,
      required String name,
      String? author,
      List<String>? cuisine,
      String? diffulty,
      required int servingsize,
      required String preptime,
      required String cookingtime,
      List<Ingredients>? ingredients,
      List<String>? directions}) {
    return Recipe._internal(
        id: id == null ? UUID.getUUID() : id,
        imageURL: imageURL,
        name: name,
        author: author,
        cuisine: cuisine != null ? List<String>.unmodifiable(cuisine) : cuisine,
        diffulty: diffulty,
        servingsize: servingsize,
        preptime: preptime,
        cookingtime: cookingtime,
        ingredients: ingredients != null
            ? List<Ingredients>.unmodifiable(ingredients)
            : ingredients,
        directions: directions != null
            ? List<String>.unmodifiable(directions)
            : directions);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Recipe &&
        id == other.id &&
        _imageURL == other._imageURL &&
        _name == other._name &&
        _author == other._author &&
        DeepCollectionEquality().equals(_cuisine, other._cuisine) &&
        _diffulty == other._diffulty &&
        _servingsize == other._servingsize &&
        _preptime == other._preptime &&
        _cookingtime == other._cookingtime &&
        DeepCollectionEquality().equals(_ingredients, other._ingredients) &&
        DeepCollectionEquality().equals(_directions, other._directions);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Recipe {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("imageURL=" + "$_imageURL" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("author=" + "$_author" + ", ");
    buffer.write(
        "cuisine=" + (_cuisine != null ? _cuisine!.toString() : "null") + ", ");
    buffer.write("diffulty=" + "$_diffulty" + ", ");
    buffer.write("servingsize=" +
        (_servingsize != null ? _servingsize!.toString() : "null") +
        ", ");
    buffer.write("preptime=" + "$_preptime" + ", ");
    buffer.write("cookingtime=" + "$_cookingtime" + ", ");
    buffer.write("directions=" +
        (_directions != null ? _directions!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Recipe copyWith(
      {String? id,
      String? imageURL,
      String? name,
      String? author,
      List<String>? cuisine,
      String? diffulty,
      int? servingsize,
      String? preptime,
      String? cookingtime,
      List<Ingredients>? ingredients,
      List<String>? directions}) {
    return Recipe._internal(
        id: id ?? this.id,
        imageURL: imageURL ?? this.imageURL,
        name: name ?? this.name,
        author: author ?? this.author,
        cuisine: cuisine ?? this.cuisine,
        diffulty: diffulty ?? this.diffulty,
        servingsize: servingsize ?? this.servingsize,
        preptime: preptime ?? this.preptime,
        cookingtime: cookingtime ?? this.cookingtime,
        ingredients: ingredients ?? this.ingredients,
        directions: directions ?? this.directions);
  }

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? UUID.getUUID() : json['id'],
        _imageURL = json['imageURL'],
        _name = json['name'],
        _author = json['author'],
        _cuisine = json['cuisine']?.cast<String>(),
        _diffulty = json['diffulty'],
        _servingsize = (json['servingsize'] as num?)?.toInt(),
        _preptime = json['preptime'],
        _cookingtime = json['cookingtime'],
        _ingredients = json['ingredients'] is List
            ? (json['ingredients'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => Ingredients.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _directions = json['directions']?.cast<String>(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageURL': _imageURL,
        'name': _name,
        'author': _author,
        'cuisine': _cuisine,
        'diffulty': _diffulty,
        'servingsize': _servingsize,
        'preptime': _preptime,
        'cookingtime': _cookingtime,
        'ingredients':
            _ingredients?.map((Ingredients? e) => e?.toJson()).toList(),
        'directions': _directions,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "recipe.id");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageURL");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField AUTHOR = QueryField(fieldName: "author");
  static final QueryField CUISINE = QueryField(fieldName: "cuisine");
  static final QueryField DIFFULTY = QueryField(fieldName: "diffulty");
  static final QueryField SERVINGSIZE = QueryField(fieldName: "servingsize");
  static final QueryField PREPTIME = QueryField(fieldName: "preptime");
  static final QueryField COOKINGTIME = QueryField(fieldName: "cookingtime");
  static final QueryField INGREDIENTS = QueryField(
      fieldName: "ingredients",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Ingredients).toString()));
  static final QueryField DIRECTIONS = QueryField(fieldName: "directions");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Recipe";
    modelSchemaDefinition.pluralName = "Recipes";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.IMAGEURL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.AUTHOR,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.CUISINE,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.string))));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.DIFFULTY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.SERVINGSIZE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.PREPTIME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.COOKINGTIME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Recipe.INGREDIENTS,
        isRequired: false,
        ofModelName: (Ingredients).toString(),
        associatedKey: Ingredients.RECIPEINGREDIENTSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Recipe.DIRECTIONS,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.string))));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _RecipeModelType extends ModelType<Recipe> {
  const _RecipeModelType();

  @override
  Recipe fromJson(Map<String, dynamic> jsonData) {
    return Recipe.fromJson(jsonData);
  }
}
