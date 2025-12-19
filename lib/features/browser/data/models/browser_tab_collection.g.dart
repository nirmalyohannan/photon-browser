// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_tab_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBrowserTabCollectionCollection on Isar {
  IsarCollection<BrowserTabCollection> get browserTabCollections =>
      this.collection();
}

const BrowserTabCollectionSchema = CollectionSchema(
  name: r'BrowserTabCollection',
  id: -5914540057977881879,
  properties: {
    r'favicon': PropertySchema(
      id: 0,
      name: r'favicon',
      type: IsarType.longList,
    ),
    r'isIncognito': PropertySchema(
      id: 1,
      name: r'isIncognito',
      type: IsarType.bool,
    ),
    r'screenshot': PropertySchema(
      id: 2,
      name: r'screenshot',
      type: IsarType.longList,
    ),
    r'scrollPosition': PropertySchema(
      id: 3,
      name: r'scrollPosition',
      type: IsarType.double,
    ),
    r'tabId': PropertySchema(id: 4, name: r'tabId', type: IsarType.string),
    r'title': PropertySchema(id: 5, name: r'title', type: IsarType.string),
    r'url': PropertySchema(id: 6, name: r'url', type: IsarType.string),
  },

  estimateSize: _browserTabCollectionEstimateSize,
  serialize: _browserTabCollectionSerialize,
  deserialize: _browserTabCollectionDeserialize,
  deserializeProp: _browserTabCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'tabId': IndexSchema(
      id: 1448272301247555965,
      name: r'tabId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tabId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _browserTabCollectionGetId,
  getLinks: _browserTabCollectionGetLinks,
  attach: _browserTabCollectionAttach,
  version: '3.3.0',
);

int _browserTabCollectionEstimateSize(
  BrowserTabCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.favicon;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.screenshot;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.tabId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _browserTabCollectionSerialize(
  BrowserTabCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.favicon);
  writer.writeBool(offsets[1], object.isIncognito);
  writer.writeLongList(offsets[2], object.screenshot);
  writer.writeDouble(offsets[3], object.scrollPosition);
  writer.writeString(offsets[4], object.tabId);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.url);
}

BrowserTabCollection _browserTabCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BrowserTabCollection();
  object.favicon = reader.readLongList(offsets[0]);
  object.id = id;
  object.isIncognito = reader.readBool(offsets[1]);
  object.screenshot = reader.readLongList(offsets[2]);
  object.scrollPosition = reader.readDouble(offsets[3]);
  object.tabId = reader.readString(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.url = reader.readString(offsets[6]);
  return object;
}

P _browserTabCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _browserTabCollectionGetId(BrowserTabCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _browserTabCollectionGetLinks(
  BrowserTabCollection object,
) {
  return [];
}

void _browserTabCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  BrowserTabCollection object,
) {
  object.id = id;
}

extension BrowserTabCollectionByIndex on IsarCollection<BrowserTabCollection> {
  Future<BrowserTabCollection?> getByTabId(String tabId) {
    return getByIndex(r'tabId', [tabId]);
  }

  BrowserTabCollection? getByTabIdSync(String tabId) {
    return getByIndexSync(r'tabId', [tabId]);
  }

  Future<bool> deleteByTabId(String tabId) {
    return deleteByIndex(r'tabId', [tabId]);
  }

  bool deleteByTabIdSync(String tabId) {
    return deleteByIndexSync(r'tabId', [tabId]);
  }

  Future<List<BrowserTabCollection?>> getAllByTabId(List<String> tabIdValues) {
    final values = tabIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tabId', values);
  }

  List<BrowserTabCollection?> getAllByTabIdSync(List<String> tabIdValues) {
    final values = tabIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tabId', values);
  }

  Future<int> deleteAllByTabId(List<String> tabIdValues) {
    final values = tabIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tabId', values);
  }

  int deleteAllByTabIdSync(List<String> tabIdValues) {
    final values = tabIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tabId', values);
  }

  Future<Id> putByTabId(BrowserTabCollection object) {
    return putByIndex(r'tabId', object);
  }

  Id putByTabIdSync(BrowserTabCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'tabId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTabId(List<BrowserTabCollection> objects) {
    return putAllByIndex(r'tabId', objects);
  }

  List<Id> putAllByTabIdSync(
    List<BrowserTabCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'tabId', objects, saveLinks: saveLinks);
  }
}

extension BrowserTabCollectionQueryWhereSort
    on QueryBuilder<BrowserTabCollection, BrowserTabCollection, QWhere> {
  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BrowserTabCollectionQueryWhere
    on QueryBuilder<BrowserTabCollection, BrowserTabCollection, QWhereClause> {
  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
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

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  tabIdEqualTo(String tabId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tabId', value: [tabId]),
      );
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterWhereClause>
  tabIdNotEqualTo(String tabId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tabId',
                lower: [],
                upper: [tabId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tabId',
                lower: [tabId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tabId',
                lower: [tabId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tabId',
                lower: [],
                upper: [tabId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension BrowserTabCollectionQueryFilter
    on
        QueryBuilder<
          BrowserTabCollection,
          BrowserTabCollection,
          QFilterCondition
        > {
  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'favicon'),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'favicon'),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'favicon', value: value),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'favicon',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'favicon',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'favicon',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'favicon', length, true, length, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'favicon', 0, true, 0, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'favicon', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'favicon', 0, true, length, include);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'favicon', length, include, 999999, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  faviconLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favicon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  isIncognitoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isIncognito', value: value),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'screenshot'),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'screenshot'),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'screenshot', value: value),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'screenshot',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'screenshot',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'screenshot',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'screenshot', length, true, length, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'screenshot', 0, true, 0, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'screenshot', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'screenshot', 0, true, length, include);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'screenshot', length, include, 999999, true);
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  screenshotLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'screenshot',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  scrollPositionEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  scrollPositionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  scrollPositionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  scrollPositionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scrollPosition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tabId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tabId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tabId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tabId', value: ''),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  tabIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tabId', value: ''),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlLessThan(String value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'url',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'url',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<
    BrowserTabCollection,
    BrowserTabCollection,
    QAfterFilterCondition
  >
  urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'url', value: ''),
      );
    });
  }
}

extension BrowserTabCollectionQueryObject
    on
        QueryBuilder<
          BrowserTabCollection,
          BrowserTabCollection,
          QFilterCondition
        > {}

extension BrowserTabCollectionQueryLinks
    on
        QueryBuilder<
          BrowserTabCollection,
          BrowserTabCollection,
          QFilterCondition
        > {}

extension BrowserTabCollectionQuerySortBy
    on QueryBuilder<BrowserTabCollection, BrowserTabCollection, QSortBy> {
  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByIsIncognito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncognito', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByIsIncognitoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncognito', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByScrollPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByTabId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabId', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByTabIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabId', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension BrowserTabCollectionQuerySortThenBy
    on QueryBuilder<BrowserTabCollection, BrowserTabCollection, QSortThenBy> {
  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByIsIncognito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncognito', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByIsIncognitoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncognito', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByScrollPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByTabId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabId', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByTabIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabId', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QAfterSortBy>
  thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension BrowserTabCollectionQueryWhereDistinct
    on QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct> {
  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByFavicon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favicon');
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByIsIncognito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIncognito');
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByScreenshot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'screenshot');
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollPosition');
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByTabId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tabId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BrowserTabCollection, BrowserTabCollection, QDistinct>
  distinctByUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension BrowserTabCollectionQueryProperty
    on
        QueryBuilder<
          BrowserTabCollection,
          BrowserTabCollection,
          QQueryProperty
        > {
  QueryBuilder<BrowserTabCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BrowserTabCollection, List<int>?, QQueryOperations>
  faviconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favicon');
    });
  }

  QueryBuilder<BrowserTabCollection, bool, QQueryOperations>
  isIncognitoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIncognito');
    });
  }

  QueryBuilder<BrowserTabCollection, List<int>?, QQueryOperations>
  screenshotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'screenshot');
    });
  }

  QueryBuilder<BrowserTabCollection, double, QQueryOperations>
  scrollPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollPosition');
    });
  }

  QueryBuilder<BrowserTabCollection, String, QQueryOperations> tabIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tabId');
    });
  }

  QueryBuilder<BrowserTabCollection, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BrowserTabCollection, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
