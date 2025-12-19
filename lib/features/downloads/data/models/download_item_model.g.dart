// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_item_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDownloadItemModelCollection on Isar {
  IsarCollection<DownloadItemModel> get downloadItemModels => this.collection();
}

const DownloadItemModelSchema = CollectionSchema(
  name: r'DownloadItemModel',
  id: -3807064466603366467,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'downloadId': PropertySchema(
      id: 1,
      name: r'downloadId',
      type: IsarType.string,
    ),
    r'filename': PropertySchema(
      id: 2,
      name: r'filename',
      type: IsarType.string,
    ),
    r'path': PropertySchema(id: 3, name: r'path', type: IsarType.string),
    r'progress': PropertySchema(
      id: 4,
      name: r'progress',
      type: IsarType.double,
    ),
    r'receivedBytes': PropertySchema(
      id: 5,
      name: r'receivedBytes',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.string,
      enumMap: _DownloadItemModelstatusEnumValueMap,
    ),
    r'totalBytes': PropertySchema(
      id: 7,
      name: r'totalBytes',
      type: IsarType.long,
    ),
    r'url': PropertySchema(id: 8, name: r'url', type: IsarType.string),
  },

  estimateSize: _downloadItemModelEstimateSize,
  serialize: _downloadItemModelSerialize,
  deserialize: _downloadItemModelDeserialize,
  deserializeProp: _downloadItemModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'downloadId': IndexSchema(
      id: 1029573681914453387,
      name: r'downloadId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'downloadId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _downloadItemModelGetId,
  getLinks: _downloadItemModelGetLinks,
  attach: _downloadItemModelAttach,
  version: '3.3.0',
);

int _downloadItemModelEstimateSize(
  DownloadItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.downloadId.length * 3;
  bytesCount += 3 + object.filename.length * 3;
  bytesCount += 3 + object.path.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _downloadItemModelSerialize(
  DownloadItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.downloadId);
  writer.writeString(offsets[2], object.filename);
  writer.writeString(offsets[3], object.path);
  writer.writeDouble(offsets[4], object.progress);
  writer.writeLong(offsets[5], object.receivedBytes);
  writer.writeString(offsets[6], object.status.name);
  writer.writeLong(offsets[7], object.totalBytes);
  writer.writeString(offsets[8], object.url);
}

DownloadItemModel _downloadItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DownloadItemModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.downloadId = reader.readString(offsets[1]);
  object.filename = reader.readString(offsets[2]);
  object.id = id;
  object.path = reader.readString(offsets[3]);
  object.progress = reader.readDouble(offsets[4]);
  object.receivedBytes = reader.readLong(offsets[5]);
  object.status =
      _DownloadItemModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[6],
      )] ??
      DownloadStatus.pending;
  object.totalBytes = reader.readLong(offsets[7]);
  object.url = reader.readString(offsets[8]);
  return object;
}

P _downloadItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (_DownloadItemModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              DownloadStatus.pending)
          as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DownloadItemModelstatusEnumValueMap = {
  r'pending': r'pending',
  r'running': r'running',
  r'paused': r'paused',
  r'completed': r'completed',
  r'failed': r'failed',
  r'canceled': r'canceled',
};
const _DownloadItemModelstatusValueEnumMap = {
  r'pending': DownloadStatus.pending,
  r'running': DownloadStatus.running,
  r'paused': DownloadStatus.paused,
  r'completed': DownloadStatus.completed,
  r'failed': DownloadStatus.failed,
  r'canceled': DownloadStatus.canceled,
};

Id _downloadItemModelGetId(DownloadItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _downloadItemModelGetLinks(
  DownloadItemModel object,
) {
  return [];
}

void _downloadItemModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  DownloadItemModel object,
) {
  object.id = id;
}

extension DownloadItemModelByIndex on IsarCollection<DownloadItemModel> {
  Future<DownloadItemModel?> getByDownloadId(String downloadId) {
    return getByIndex(r'downloadId', [downloadId]);
  }

  DownloadItemModel? getByDownloadIdSync(String downloadId) {
    return getByIndexSync(r'downloadId', [downloadId]);
  }

  Future<bool> deleteByDownloadId(String downloadId) {
    return deleteByIndex(r'downloadId', [downloadId]);
  }

  bool deleteByDownloadIdSync(String downloadId) {
    return deleteByIndexSync(r'downloadId', [downloadId]);
  }

  Future<List<DownloadItemModel?>> getAllByDownloadId(
    List<String> downloadIdValues,
  ) {
    final values = downloadIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'downloadId', values);
  }

  List<DownloadItemModel?> getAllByDownloadIdSync(
    List<String> downloadIdValues,
  ) {
    final values = downloadIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'downloadId', values);
  }

  Future<int> deleteAllByDownloadId(List<String> downloadIdValues) {
    final values = downloadIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'downloadId', values);
  }

  int deleteAllByDownloadIdSync(List<String> downloadIdValues) {
    final values = downloadIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'downloadId', values);
  }

  Future<Id> putByDownloadId(DownloadItemModel object) {
    return putByIndex(r'downloadId', object);
  }

  Id putByDownloadIdSync(DownloadItemModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'downloadId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDownloadId(List<DownloadItemModel> objects) {
    return putAllByIndex(r'downloadId', objects);
  }

  List<Id> putAllByDownloadIdSync(
    List<DownloadItemModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'downloadId', objects, saveLinks: saveLinks);
  }
}

extension DownloadItemModelQueryWhereSort
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QWhere> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DownloadItemModelQueryWhere
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QWhereClause> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
  downloadIdEqualTo(String downloadId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'downloadId', value: [downloadId]),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterWhereClause>
  downloadIdNotEqualTo(String downloadId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'downloadId',
                lower: [],
                upper: [downloadId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'downloadId',
                lower: [downloadId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'downloadId',
                lower: [downloadId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'downloadId',
                lower: [],
                upper: [downloadId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension DownloadItemModelQueryFilter
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QFilterCondition> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'downloadId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'downloadId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'downloadId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'downloadId', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  downloadIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'downloadId', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'filename',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'filename',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'filename',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'filename', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  filenameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'filename', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'path',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'path',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'path', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'path', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  progressEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  progressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  progressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  progressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  receivedBytesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'receivedBytes', value: value),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  receivedBytesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'receivedBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  receivedBytesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'receivedBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  receivedBytesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'receivedBytes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusEqualTo(DownloadStatus value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusGreaterThan(
    DownloadStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusLessThan(
    DownloadStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusBetween(
    DownloadStatus lower,
    DownloadStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  totalBytesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalBytes', value: value),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  totalBytesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  totalBytesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  totalBytesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalBytes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
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

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterFilterCondition>
  urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'url', value: ''),
      );
    });
  }
}

extension DownloadItemModelQueryObject
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QFilterCondition> {}

extension DownloadItemModelQueryLinks
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QFilterCondition> {}

extension DownloadItemModelQuerySortBy
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QSortBy> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByDownloadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadId', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByDownloadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadId', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByFilename() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByFilenameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByReceivedBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedBytes', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByReceivedBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedBytes', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByTotalBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBytes', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByTotalBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBytes', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension DownloadItemModelQuerySortThenBy
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QSortThenBy> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByDownloadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadId', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByDownloadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadId', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByFilename() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByFilenameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByReceivedBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedBytes', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByReceivedBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedBytes', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByTotalBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBytes', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByTotalBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBytes', Sort.desc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QAfterSortBy>
  thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension DownloadItemModelQueryWhereDistinct
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct> {
  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByDownloadId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByFilename({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filename', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct> distinctByPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByReceivedBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedBytes');
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct>
  distinctByTotalBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBytes');
    });
  }

  QueryBuilder<DownloadItemModel, DownloadItemModel, QDistinct> distinctByUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension DownloadItemModelQueryProperty
    on QueryBuilder<DownloadItemModel, DownloadItemModel, QQueryProperty> {
  QueryBuilder<DownloadItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DownloadItemModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DownloadItemModel, String, QQueryOperations>
  downloadIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadId');
    });
  }

  QueryBuilder<DownloadItemModel, String, QQueryOperations> filenameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filename');
    });
  }

  QueryBuilder<DownloadItemModel, String, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<DownloadItemModel, double, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<DownloadItemModel, int, QQueryOperations>
  receivedBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedBytes');
    });
  }

  QueryBuilder<DownloadItemModel, DownloadStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DownloadItemModel, int, QQueryOperations> totalBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBytes');
    });
  }

  QueryBuilder<DownloadItemModel, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
