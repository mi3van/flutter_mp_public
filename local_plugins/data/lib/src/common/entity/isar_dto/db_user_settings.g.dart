// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_user_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDbUserSettingsCollection on Isar {
  IsarCollection<DbUserSettings> get dbUserSettings => this.collection();
}

const DbUserSettingsSchema = CollectionSchema(
  name: r'DbUserSettings',
  id: -6930201025430511996,
  properties: {
    r'imageCompressValue': PropertySchema(
      id: 0,
      name: r'imageCompressValue',
      type: IsarType.long,
    ),
    r'isCameraFlashEnabled': PropertySchema(
      id: 1,
      name: r'isCameraFlashEnabled',
      type: IsarType.bool,
    ),
    r'isPrintReportUiMode': PropertySchema(
      id: 2,
      name: r'isPrintReportUiMode',
      type: IsarType.bool,
    ),
    r'isWelcomeWathed': PropertySchema(
      id: 3,
      name: r'isWelcomeWathed',
      type: IsarType.bool,
    ),
    r'localeCode': PropertySchema(
      id: 4,
      name: r'localeCode',
      type: IsarType.string,
    ),
    r'printColumnsSize': PropertySchema(
      id: 5,
      name: r'printColumnsSize',
      type: IsarType.byte,
    ),
    r'printReportColumnsCount': PropertySchema(
      id: 6,
      name: r'printReportColumnsCount',
      type: IsarType.byte,
    ),
    r'sortModelValue': PropertySchema(
      id: 7,
      name: r'sortModelValue',
      type: IsarType.byte,
    ),
    r'syncFrequencyValue': PropertySchema(
      id: 8,
      name: r'syncFrequencyValue',
      type: IsarType.long,
    ),
    r'themingValue': PropertySchema(
      id: 9,
      name: r'themingValue',
      type: IsarType.long,
    ),
    r'tooltipsWatched': PropertySchema(
      id: 10,
      name: r'tooltipsWatched',
      type: IsarType.long,
    )
  },
  estimateSize: _dbUserSettingsEstimateSize,
  serialize: _dbUserSettingsSerialize,
  deserialize: _dbUserSettingsDeserialize,
  deserializeProp: _dbUserSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbUserSettingsGetId,
  getLinks: _dbUserSettingsGetLinks,
  attach: _dbUserSettingsAttach,
  version: '3.1.0+1',
);

int _dbUserSettingsEstimateSize(
  DbUserSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.localeCode.length * 3;
  return bytesCount;
}

void _dbUserSettingsSerialize(
  DbUserSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.imageCompressValue);
  writer.writeBool(offsets[1], object.isCameraFlashEnabled);
  writer.writeBool(offsets[2], object.isPrintReportUiMode);
  writer.writeBool(offsets[3], object.isWelcomeWathed);
  writer.writeString(offsets[4], object.localeCode);
  writer.writeByte(offsets[5], object.printQrColumnsCount);
  writer.writeByte(offsets[6], object.printReportColumnsCount);
  writer.writeByte(offsets[7], object.sortModelValue);
  writer.writeLong(offsets[8], object.syncFrequencyValue);
  writer.writeLong(offsets[9], object.themingValue);
  writer.writeLong(offsets[10], object.tooltipsWatched);
}

DbUserSettings _dbUserSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbUserSettings(
    imageCompressValue: reader.readLong(offsets[0]),
    isCameraFlashEnabled: reader.readBool(offsets[1]),
    isPrintReportUiMode: reader.readBool(offsets[2]),
    isWelcomeWathed: reader.readBool(offsets[3]),
    localeCode: reader.readString(offsets[4]),
    printQrColumnsCount: reader.readByte(offsets[5]),
    printReportColumnsCount: reader.readByte(offsets[6]),
    sortModelValue: reader.readByte(offsets[7]),
    syncFrequencyValue: reader.readLong(offsets[8]),
    themingValue: reader.readLong(offsets[9]),
    tooltipsWatched: reader.readLong(offsets[10]),
  );
  object.id = id;
  return object;
}

P _dbUserSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readByte(offset)) as P;
    case 6:
      return (reader.readByte(offset)) as P;
    case 7:
      return (reader.readByte(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbUserSettingsGetId(DbUserSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbUserSettingsGetLinks(DbUserSettings object) {
  return [];
}

void _dbUserSettingsAttach(
    IsarCollection<dynamic> col, Id id, DbUserSettings object) {
  object.id = id;
}

extension DbUserSettingsQueryWhereSort
    on QueryBuilder<DbUserSettings, DbUserSettings, QWhere> {
  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbUserSettingsQueryWhere
    on QueryBuilder<DbUserSettings, DbUserSettings, QWhereClause> {
  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbUserSettingsQueryFilter
    on QueryBuilder<DbUserSettings, DbUserSettings, QFilterCondition> {
  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      imageCompressValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageCompressValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      imageCompressValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageCompressValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      imageCompressValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageCompressValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      imageCompressValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageCompressValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      isCameraFlashEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCameraFlashEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      isPrintReportUiModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPrintReportUiMode',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      isWelcomeWathedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWelcomeWathed',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      localeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printQrColumnsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'printColumnsSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printQrColumnsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'printColumnsSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printQrColumnsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'printColumnsSize',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printQrColumnsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'printColumnsSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printReportColumnsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'printReportColumnsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printReportColumnsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'printReportColumnsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printReportColumnsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'printReportColumnsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      printReportColumnsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'printReportColumnsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      sortModelValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortModelValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      sortModelValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortModelValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      sortModelValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortModelValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      sortModelValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortModelValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      syncFrequencyValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      syncFrequencyValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      syncFrequencyValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      syncFrequencyValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncFrequencyValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      themingValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themingValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      themingValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themingValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      themingValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themingValue',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      themingValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themingValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      tooltipsWatchedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tooltipsWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      tooltipsWatchedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tooltipsWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      tooltipsWatchedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tooltipsWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterFilterCondition>
      tooltipsWatchedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tooltipsWatched',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbUserSettingsQueryObject
    on QueryBuilder<DbUserSettings, DbUserSettings, QFilterCondition> {}

extension DbUserSettingsQueryLinks
    on QueryBuilder<DbUserSettings, DbUserSettings, QFilterCondition> {}

extension DbUserSettingsQuerySortBy
    on QueryBuilder<DbUserSettings, DbUserSettings, QSortBy> {
  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByImageCompressValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageCompressValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByImageCompressValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageCompressValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsCameraFlashEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCameraFlashEnabled', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsCameraFlashEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCameraFlashEnabled', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsPrintReportUiMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrintReportUiMode', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsPrintReportUiModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrintReportUiMode', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsWelcomeWathed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWelcomeWathed', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByIsWelcomeWathedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWelcomeWathed', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByLocaleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localeCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByLocaleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localeCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByPrintQrColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printColumnsSize', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByPrintQrColumnsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printColumnsSize', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByPrintReportColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printReportColumnsCount', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByPrintReportColumnsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printReportColumnsCount', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortBySortModelValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortModelValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortBySortModelValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortModelValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortBySyncFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortBySyncFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFrequencyValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByThemingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themingValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByThemingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themingValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByTooltipsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tooltipsWatched', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      sortByTooltipsWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tooltipsWatched', Sort.desc);
    });
  }
}

extension DbUserSettingsQuerySortThenBy
    on QueryBuilder<DbUserSettings, DbUserSettings, QSortThenBy> {
  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByImageCompressValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageCompressValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByImageCompressValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageCompressValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsCameraFlashEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCameraFlashEnabled', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsCameraFlashEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCameraFlashEnabled', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsPrintReportUiMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrintReportUiMode', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsPrintReportUiModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrintReportUiMode', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsWelcomeWathed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWelcomeWathed', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByIsWelcomeWathedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWelcomeWathed', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByLocaleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localeCode', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByLocaleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localeCode', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByPrintQrColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printColumnsSize', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByPrintQrColumnsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printColumnsSize', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByPrintReportColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printReportColumnsCount', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByPrintReportColumnsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printReportColumnsCount', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenBySortModelValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortModelValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenBySortModelValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortModelValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenBySyncFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenBySyncFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFrequencyValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByThemingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themingValue', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByThemingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themingValue', Sort.desc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByTooltipsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tooltipsWatched', Sort.asc);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QAfterSortBy>
      thenByTooltipsWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tooltipsWatched', Sort.desc);
    });
  }
}

extension DbUserSettingsQueryWhereDistinct
    on QueryBuilder<DbUserSettings, DbUserSettings, QDistinct> {
  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByImageCompressValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageCompressValue');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByIsCameraFlashEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCameraFlashEnabled');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByIsPrintReportUiMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPrintReportUiMode');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByIsWelcomeWathed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWelcomeWathed');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct> distinctByLocaleCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByPrintQrColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'printColumnsSize');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByPrintReportColumnsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'printReportColumnsCount');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctBySortModelValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortModelValue');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctBySyncFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncFrequencyValue');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByThemingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themingValue');
    });
  }

  QueryBuilder<DbUserSettings, DbUserSettings, QDistinct>
      distinctByTooltipsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tooltipsWatched');
    });
  }
}

extension DbUserSettingsQueryProperty
    on QueryBuilder<DbUserSettings, DbUserSettings, QQueryProperty> {
  QueryBuilder<DbUserSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations>
      imageCompressValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageCompressValue');
    });
  }

  QueryBuilder<DbUserSettings, bool, QQueryOperations>
      isCameraFlashEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCameraFlashEnabled');
    });
  }

  QueryBuilder<DbUserSettings, bool, QQueryOperations>
      isPrintReportUiModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPrintReportUiMode');
    });
  }

  QueryBuilder<DbUserSettings, bool, QQueryOperations>
      isWelcomeWathedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWelcomeWathed');
    });
  }

  QueryBuilder<DbUserSettings, String, QQueryOperations> localeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localeCode');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations>
      printQrColumnsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'printColumnsSize');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations>
      printReportColumnsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'printReportColumnsCount');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations> sortModelValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortModelValue');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations>
      syncFrequencyValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncFrequencyValue');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations> themingValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themingValue');
    });
  }

  QueryBuilder<DbUserSettings, int, QQueryOperations>
      tooltipsWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tooltipsWatched');
    });
  }
}
