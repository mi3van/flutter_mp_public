// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_user_private_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDbUserPrivateDataCollection on Isar {
  IsarCollection<DbUserPrivateData> get dbUserPrivateDatas => this.collection();
}

const DbUserPrivateDataSchema = CollectionSchema(
  name: r'DbUserPrivateData',
  id: 4667417780613894122,
  properties: {
    r'blockedFileEventUuid': PropertySchema(
      id: 0,
      name: r'blockedFileEventUuid',
      type: IsarType.string,
    ),
    r'blockedItemEventUuid': PropertySchema(
      id: 1,
      name: r'blockedItemEventUuid',
      type: IsarType.string,
    ),
    r'eventsFileCountForCheck': PropertySchema(
      id: 2,
      name: r'eventsFileCountForCheck',
      type: IsarType.long,
    ),
    r'eventsItemCountForCheck': PropertySchema(
      id: 3,
      name: r'eventsItemCountForCheck',
      type: IsarType.long,
    ),
    r'lastFileHandledEventUuid': PropertySchema(
      id: 4,
      name: r'lastFileHandledEventUuid',
      type: IsarType.string,
    ),
    r'lastFileSyncedEventUuid': PropertySchema(
      id: 5,
      name: r'lastFileSyncedEventUuid',
      type: IsarType.string,
    ),
    r'lastItemHandledEventUuid': PropertySchema(
      id: 6,
      name: r'lastItemHandledEventUuid',
      type: IsarType.string,
    ),
    r'lastItemSyncedEventUuid': PropertySchema(
      id: 7,
      name: r'lastItemSyncedEventUuid',
      type: IsarType.string,
    ),
    r'lastSyncedDate': PropertySchema(
      id: 8,
      name: r'lastSyncedDate',
      type: IsarType.dateTime,
    ),
    r'syncFileNextPageTokn': PropertySchema(
      id: 9,
      name: r'syncFileNextPageTokn',
      type: IsarType.string,
    ),
    r'syncItemNextPageTokn': PropertySchema(
      id: 10,
      name: r'syncItemNextPageTokn',
      type: IsarType.string,
    )
  },
  estimateSize: _dbUserPrivateDataEstimateSize,
  serialize: _dbUserPrivateDataSerialize,
  deserialize: _dbUserPrivateDataDeserialize,
  deserializeProp: _dbUserPrivateDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbUserPrivateDataGetId,
  getLinks: _dbUserPrivateDataGetLinks,
  attach: _dbUserPrivateDataAttach,
  version: '3.1.0+1',
);

int _dbUserPrivateDataEstimateSize(
  DbUserPrivateData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.blockedFileEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.blockedItemEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastFileHandledEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastFileSyncedEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastItemHandledEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastItemSyncedEventUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syncFileNextPageTokn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syncItemNextPageTokn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dbUserPrivateDataSerialize(
  DbUserPrivateData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.blockedFileEventUuid);
  writer.writeString(offsets[1], object.blockedItemEventUuid);
  writer.writeLong(offsets[2], object.eventsFileCountForCheck);
  writer.writeLong(offsets[3], object.eventsItemCountForCheck);
  writer.writeString(offsets[4], object.lastFileHandledEventUuid);
  writer.writeString(offsets[5], object.lastFileSyncedEventUuid);
  writer.writeString(offsets[6], object.lastItemHandledEventUuid);
  writer.writeString(offsets[7], object.lastItemSyncedEventUuid);
  writer.writeDateTime(offsets[8], object.lastSyncedDate);
  writer.writeString(offsets[9], object.syncFileNextPageTokn);
  writer.writeString(offsets[10], object.syncItemNextPageTokn);
}

DbUserPrivateData _dbUserPrivateDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbUserPrivateData();
  object.blockedFileEventUuid = reader.readStringOrNull(offsets[0]);
  object.blockedItemEventUuid = reader.readStringOrNull(offsets[1]);
  object.eventsFileCountForCheck = reader.readLongOrNull(offsets[2]);
  object.eventsItemCountForCheck = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.lastFileHandledEventUuid = reader.readStringOrNull(offsets[4]);
  object.lastFileSyncedEventUuid = reader.readStringOrNull(offsets[5]);
  object.lastItemHandledEventUuid = reader.readStringOrNull(offsets[6]);
  object.lastItemSyncedEventUuid = reader.readStringOrNull(offsets[7]);
  object.lastSyncedDate = reader.readDateTimeOrNull(offsets[8]);
  object.syncFileNextPageTokn = reader.readStringOrNull(offsets[9]);
  object.syncItemNextPageTokn = reader.readStringOrNull(offsets[10]);
  return object;
}

P _dbUserPrivateDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbUserPrivateDataGetId(DbUserPrivateData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbUserPrivateDataGetLinks(
    DbUserPrivateData object) {
  return [];
}

void _dbUserPrivateDataAttach(
    IsarCollection<dynamic> col, Id id, DbUserPrivateData object) {
  object.id = id;
}

extension DbUserPrivateDataQueryWhereSort
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QWhere> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbUserPrivateDataQueryWhere
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QWhereClause> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterWhereClause>
      idBetween(
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

extension DbUserPrivateDataQueryFilter
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QFilterCondition> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockedFileEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockedFileEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockedFileEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockedFileEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockedFileEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedFileEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedFileEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockedFileEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockedItemEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockedItemEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockedItemEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockedItemEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockedItemEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedItemEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      blockedItemEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockedItemEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventsFileCountForCheck',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventsFileCountForCheck',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventsFileCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventsFileCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventsFileCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsFileCountForCheckBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventsFileCountForCheck',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventsItemCountForCheck',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventsItemCountForCheck',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventsItemCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventsItemCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventsItemCountForCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      eventsItemCountForCheckBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventsItemCountForCheck',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
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

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
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

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastFileHandledEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastFileHandledEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastFileHandledEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastFileHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastFileHandledEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFileHandledEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileHandledEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastFileHandledEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastFileSyncedEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastFileSyncedEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastFileSyncedEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastFileSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastFileSyncedEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFileSyncedEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastFileSyncedEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastFileSyncedEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastItemHandledEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastItemHandledEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastItemHandledEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastItemHandledEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastItemHandledEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastItemHandledEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemHandledEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastItemHandledEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastItemSyncedEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastItemSyncedEventUuid',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastItemSyncedEventUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastItemSyncedEventUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastItemSyncedEventUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastItemSyncedEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastItemSyncedEventUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastItemSyncedEventUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedDate',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedDate',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      lastSyncedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncFileNextPageTokn',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncFileNextPageTokn',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncFileNextPageTokn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncFileNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncFileNextPageTokn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncFileNextPageTokn',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncFileNextPageToknIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncFileNextPageTokn',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncItemNextPageTokn',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncItemNextPageTokn',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncItemNextPageTokn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncItemNextPageTokn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncItemNextPageTokn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncItemNextPageTokn',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterFilterCondition>
      syncItemNextPageToknIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncItemNextPageTokn',
        value: '',
      ));
    });
  }
}

extension DbUserPrivateDataQueryObject
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QFilterCondition> {}

extension DbUserPrivateDataQueryLinks
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QFilterCondition> {}

extension DbUserPrivateDataQuerySortBy
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QSortBy> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByBlockedFileEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedFileEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByBlockedFileEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedFileEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByBlockedItemEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedItemEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByBlockedItemEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedItemEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByEventsFileCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsFileCountForCheck', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByEventsFileCountForCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsFileCountForCheck', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByEventsItemCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsItemCountForCheck', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByEventsItemCountForCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsItemCountForCheck', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastFileHandledEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileHandledEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastFileHandledEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileHandledEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastFileSyncedEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileSyncedEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastFileSyncedEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileSyncedEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastItemHandledEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemHandledEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastItemHandledEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemHandledEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastItemSyncedEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemSyncedEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastItemSyncedEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemSyncedEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastSyncedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedDate', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortByLastSyncedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedDate', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortBySyncFileNextPageTokn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFileNextPageTokn', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortBySyncFileNextPageToknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFileNextPageTokn', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortBySyncItemNextPageTokn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncItemNextPageTokn', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      sortBySyncItemNextPageToknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncItemNextPageTokn', Sort.desc);
    });
  }
}

extension DbUserPrivateDataQuerySortThenBy
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QSortThenBy> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByBlockedFileEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedFileEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByBlockedFileEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedFileEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByBlockedItemEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedItemEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByBlockedItemEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockedItemEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByEventsFileCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsFileCountForCheck', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByEventsFileCountForCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsFileCountForCheck', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByEventsItemCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsItemCountForCheck', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByEventsItemCountForCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventsItemCountForCheck', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastFileHandledEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileHandledEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastFileHandledEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileHandledEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastFileSyncedEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileSyncedEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastFileSyncedEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFileSyncedEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastItemHandledEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemHandledEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastItemHandledEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemHandledEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastItemSyncedEventUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemSyncedEventUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastItemSyncedEventUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemSyncedEventUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastSyncedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedDate', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenByLastSyncedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedDate', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenBySyncFileNextPageTokn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFileNextPageTokn', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenBySyncFileNextPageToknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncFileNextPageTokn', Sort.desc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenBySyncItemNextPageTokn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncItemNextPageTokn', Sort.asc);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QAfterSortBy>
      thenBySyncItemNextPageToknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncItemNextPageTokn', Sort.desc);
    });
  }
}

extension DbUserPrivateDataQueryWhereDistinct
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct> {
  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByBlockedFileEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockedFileEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByBlockedItemEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockedItemEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByEventsFileCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventsFileCountForCheck');
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByEventsItemCountForCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventsItemCountForCheck');
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByLastFileHandledEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastFileHandledEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByLastFileSyncedEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastFileSyncedEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByLastItemHandledEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastItemHandledEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByLastItemSyncedEventUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastItemSyncedEventUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctByLastSyncedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedDate');
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctBySyncFileNextPageTokn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncFileNextPageTokn',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUserPrivateData, DbUserPrivateData, QDistinct>
      distinctBySyncItemNextPageTokn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncItemNextPageTokn',
          caseSensitive: caseSensitive);
    });
  }
}

extension DbUserPrivateDataQueryProperty
    on QueryBuilder<DbUserPrivateData, DbUserPrivateData, QQueryProperty> {
  QueryBuilder<DbUserPrivateData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      blockedFileEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockedFileEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      blockedItemEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockedItemEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, int?, QQueryOperations>
      eventsFileCountForCheckProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventsFileCountForCheck');
    });
  }

  QueryBuilder<DbUserPrivateData, int?, QQueryOperations>
      eventsItemCountForCheckProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventsItemCountForCheck');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      lastFileHandledEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastFileHandledEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      lastFileSyncedEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastFileSyncedEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      lastItemHandledEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastItemHandledEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      lastItemSyncedEventUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastItemSyncedEventUuid');
    });
  }

  QueryBuilder<DbUserPrivateData, DateTime?, QQueryOperations>
      lastSyncedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedDate');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      syncFileNextPageToknProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncFileNextPageTokn');
    });
  }

  QueryBuilder<DbUserPrivateData, String?, QQueryOperations>
      syncItemNextPageToknProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncItemNextPageTokn');
    });
  }
}
