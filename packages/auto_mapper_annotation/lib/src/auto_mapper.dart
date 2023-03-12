//ignore_for_file: avoid-dynamic

/// Annotates class which will be used as base for generated mapper.
class AutoMapper {
  ///
  final List<AutoMap<dynamic, dynamic>> mappers;

  /// Constructs AutoMapper.
  const AutoMapper({
    this.mappers = const [],
  });
}

/// Const for AutoMapper annotation.
// ignore: prefer-static-class, it is annotation
const mapper = AutoMapper();

/// Configured mapping from SOURCE to TARGET.
class AutoMap<SOURCE, TARGET> {
  /// Reverse mapping will be generated as well (from TARGET to SOURCE).
  ///
  /// Note that if concrete mapping from TARGET -> SOURCE is configured, reverse flag is ignored.
  final bool reverse;

  /// Configuration for TARGET's members.
  final List<MapMember<SOURCE>> mappings;

  /// Provides default value if SOURCE is null.
  final TARGET Function()? whenNullDefault;

  /// Constructs mapping.
  const AutoMap({
    this.reverse = false,
    this.mappings = const [],
    this.whenNullDefault,
  });
}

/// Mapping configuration for concrete member of target class.
class MapMember<SOURCE> {
  /// Which member is mapped.
  ///
  /// It should be either name of TARGET's field OR name of TARGET's constructor.
  final String member;

  /// Custom function mapping for given [member].
  final dynamic Function(SOURCE from)? custom;

  /// Given [member] should be ignored.
  ///
  /// Note that if [member] is required (or non-nullable) it is considered as error.
  final bool ignore;

  /// Given [member] should be mapped from [rename].
  ///
  /// Note that [custom] has priority.
  final String? rename;

  /// Constructs member mapping.
  const MapMember({
    required this.member,
    this.custom,
    this.ignore = false,
    this.rename,
  });
}