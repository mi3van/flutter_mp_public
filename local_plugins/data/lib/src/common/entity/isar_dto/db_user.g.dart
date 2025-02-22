// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDbUserCollection on Isar {
  IsarCollection<DbUser> get dbUsers => this.collection();
}

const DbUserSchema = CollectionSchema(
  name: r'DbUser',
  id: -9131662857584035194,
  properties: {
    r'avatarPreview': PropertySchema(
      id: 0,
      name: r'avatarPreview',
      type: IsarType.longList,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'nickname': PropertySchema(
      id: 2,
      name: r'nickname',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 3,
      name: r'role',
      type: IsarType.string,
    ),
    r'rootFolderUuid': PropertySchema(
      id: 4,
      name: r'rootFolderUuid',
      type: IsarType.string,
    ),
    r'userPathUuid': PropertySchema(
      id: 5,
      name: r'userPathUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _dbUserEstimateSize,
  serialize: _dbUserSerialize,
  deserialize: _dbUserDeserialize,
  deserializeProp: _dbUserDeserializeProp,
  idName: r'id',
  indexes: {
    r'userPathUuid': IndexSchema(
      id: -3506595379306152523,
      name: r'userPathUuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userPathUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'email': IndexSchema(
      id: -26095440403582047,
      name: r'email',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'email',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'role': IndexSchema(
      id: -7450883916179829259,
      name: r'role',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'role',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'userPrivateDataLink': LinkSchema(
      id: 2680764997299659011,
      name: r'userPrivateDataLink',
      target: r'DbUserPrivateData',
      single: true,
    ),
    r'userSettingsLink': LinkSchema(
      id: 9074412224021964459,
      name: r'userSettingsLink',
      target: r'DbUserSettings',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _dbUserGetId,
  getLinks: _dbUserGetLinks,
  attach: _dbUserAttach,
  version: '3.1.0+1',
);

int _dbUserEstimateSize(
  DbUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarPreview;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.email.length * 3;
  {
    final value = object.nickname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.role;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rootFolderUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userPathUuid.length * 3;
  return bytesCount;
}

void _dbUserSerialize(
  DbUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.avatarPreview);
  writer.writeString(offsets[1], object.email);
  writer.writeString(offsets[2], object.nickname);
  writer.writeString(offsets[3], object.role);
  writer.writeString(offsets[4], object.rootFolderUuid);
  writer.writeString(offsets[5], object.userPathUuid);
}

DbUser _dbUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbUser();
  object.avatarPreview = reader.readLongList(offsets[0]);
  object.email = reader.readString(offsets[1]);
  object.id = id;
  object.nickname = reader.readStringOrNull(offsets[2]);
  object.role = reader.readStringOrNull(offsets[3]);
  object.rootFolderUuid = reader.readStringOrNull(offsets[4]);
  object.userPathUuid = reader.readString(offsets[5]);
  return object;
}

P _dbUserDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbUserGetId(DbUser object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbUserGetLinks(DbUser object) {
  return [object.userPrivateDataLink, object.userSettingsLink];
}

void _dbUserAttach(IsarCollection<dynamic> col, Id id, DbUser object) {
  object.id = id;
  object.userPrivateDataLink.attach(col,
      col.isar.collection<DbUserPrivateData>(), r'userPrivateDataLink', id);
  object.userSettingsLink.attach(
      col, col.isar.collection<DbUserSettings>(), r'userSettingsLink', id);
}

extension DbUserByIndex on IsarCollection<DbUser> {
  Future<DbUser?> getByUserPathUuid(String userPathUuid) {
    return getByIndex(r'userPathUuid', [userPathUuid]);
  }

  DbUser? getByUserPathUuidSync(String userPathUuid) {
    return getByIndexSync(r'userPathUuid', [userPathUuid]);
  }

  Future<bool> deleteByUserPathUuid(String userPathUuid) {
    return deleteByIndex(r'userPathUuid', [userPathUuid]);
  }

  bool deleteByUserPathUuidSync(String userPathUuid) {
    return deleteByIndexSync(r'userPathUuid', [userPathUuid]);
  }

  Future<List<DbUser?>> getAllByUserPathUuid(List<String> userPathUuidValues) {
    final values = userPathUuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'userPathUuid', values);
  }

  List<DbUser?> getAllByUserPathUuidSync(List<String> userPathUuidValues) {
    final values = userPathUuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userPathUuid', values);
  }

  Future<int> deleteAllByUserPathUuid(List<String> userPathUuidValues) {
    final values = userPathUuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userPathUuid', values);
  }

  int deleteAllByUserPathUuidSync(List<String> userPathUuidValues) {
    final values = userPathUuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userPathUuid', values);
  }

  Future<Id> putByUserPathUuid(DbUser object) {
    return putByIndex(r'userPathUuid', object);
  }

  Id putByUserPathUuidSync(DbUser object, {bool saveLinks = true}) {
    return putByIndexSync(r'userPathUuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserPathUuid(List<DbUser> objects) {
    return putAllByIndex(r'userPathUuid', objects);
  }

  List<Id> putAllByUserPathUuidSync(List<DbUser> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userPathUuid', objects, saveLinks: saveLinks);
  }

  Future<DbUser?> getByEmail(String email) {
    return getByIndex(r'email', [email]);
  }

  DbUser? getByEmailSync(String email) {
    return getByIndexSync(r'email', [email]);
  }

  Future<bool> deleteByEmail(String email) {
    return deleteByIndex(r'email', [email]);
  }

  bool deleteByEmailSync(String email) {
    return deleteByIndexSync(r'email', [email]);
  }

  Future<List<DbUser?>> getAllByEmail(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndex(r'email', values);
  }

  List<DbUser?> getAllByEmailSync(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'email', values);
  }

  Future<int> deleteAllByEmail(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'email', values);
  }

  int deleteAllByEmailSync(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'email', values);
  }

  Future<Id> putByEmail(DbUser object) {
    return putByIndex(r'email', object);
  }

  Id putByEmailSync(DbUser object, {bool saveLinks = true}) {
    return putByIndexSync(r'email', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEmail(List<DbUser> objects) {
    return putAllByIndex(r'email', objects);
  }

  List<Id> putAllByEmailSync(List<DbUser> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'email', objects, saveLinks: saveLinks);
  }
}

extension DbUserQueryWhereSort on QueryBuilder<DbUser, DbUser, QWhere> {
  QueryBuilder<DbUser, DbUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbUserQueryWhere on QueryBuilder<DbUser, DbUser, QWhereClause> {
  QueryBuilder<DbUser, DbUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> idBetween(
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

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> userPathUuidEqualTo(
      String userPathUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userPathUuid',
        value: [userPathUuid],
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> userPathUuidNotEqualTo(
      String userPathUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userPathUuid',
              lower: [],
              upper: [userPathUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userPathUuid',
              lower: [userPathUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userPathUuid',
              lower: [userPathUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userPathUuid',
              lower: [],
              upper: [userPathUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> emailEqualTo(String email) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [email],
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> emailNotEqualTo(
      String email) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'role',
        value: [null],
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'role',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> roleEqualTo(String? role) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'role',
        value: [role],
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterWhereClause> roleNotEqualTo(String? role) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'role',
              lower: [],
              upper: [role],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'role',
              lower: [role],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'role',
              lower: [role],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'role',
              lower: [],
              upper: [role],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DbUserQueryFilter on QueryBuilder<DbUser, DbUser, QFilterCondition> {
  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> avatarPreviewIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarPreview',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> avatarPreviewIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarPreview',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPreview',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarPreview',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarPreview',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarPreview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> avatarPreviewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      avatarPreviewLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avatarPreview',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nickname',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nickname',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nickname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nickname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickname',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> nicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nickname',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rootFolderUuid',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      rootFolderUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rootFolderUuid',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rootFolderUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rootFolderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rootFolderUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> rootFolderUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rootFolderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      rootFolderUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rootFolderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userPathUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userPathUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userPathUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userPathUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPathUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userPathUuid',
        value: '',
      ));
    });
  }
}

extension DbUserQueryObject on QueryBuilder<DbUser, DbUser, QFilterCondition> {}

extension DbUserQueryLinks on QueryBuilder<DbUser, DbUser, QFilterCondition> {
  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userPrivateDataLink(
      FilterQuery<DbUserPrivateData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'userPrivateDataLink');
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition>
      userPrivateDataLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'userPrivateDataLink', 0, true, 0, true);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userSettingsLink(
      FilterQuery<DbUserSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'userSettingsLink');
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterFilterCondition> userSettingsLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'userSettingsLink', 0, true, 0, true);
    });
  }
}

extension DbUserQuerySortBy on QueryBuilder<DbUser, DbUser, QSortBy> {
  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByRootFolderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootFolderUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByRootFolderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootFolderUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByUserPathUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPathUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> sortByUserPathUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPathUuid', Sort.desc);
    });
  }
}

extension DbUserQuerySortThenBy on QueryBuilder<DbUser, DbUser, QSortThenBy> {
  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByRootFolderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootFolderUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByRootFolderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootFolderUuid', Sort.desc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByUserPathUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPathUuid', Sort.asc);
    });
  }

  QueryBuilder<DbUser, DbUser, QAfterSortBy> thenByUserPathUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userPathUuid', Sort.desc);
    });
  }
}

extension DbUserQueryWhereDistinct on QueryBuilder<DbUser, DbUser, QDistinct> {
  QueryBuilder<DbUser, DbUser, QDistinct> distinctByAvatarPreview() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarPreview');
    });
  }

  QueryBuilder<DbUser, DbUser, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUser, DbUser, QDistinct> distinctByNickname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUser, DbUser, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUser, DbUser, QDistinct> distinctByRootFolderUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rootFolderUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbUser, DbUser, QDistinct> distinctByUserPathUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userPathUuid', caseSensitive: caseSensitive);
    });
  }
}

extension DbUserQueryProperty on QueryBuilder<DbUser, DbUser, QQueryProperty> {
  QueryBuilder<DbUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbUser, List<int>?, QQueryOperations> avatarPreviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarPreview');
    });
  }

  QueryBuilder<DbUser, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<DbUser, String?, QQueryOperations> nicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickname');
    });
  }

  QueryBuilder<DbUser, String?, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<DbUser, String?, QQueryOperations> rootFolderUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rootFolderUuid');
    });
  }

  QueryBuilder<DbUser, String, QQueryOperations> userPathUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userPathUuid');
    });
  }
}
