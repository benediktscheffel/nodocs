import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_model.freezed.dart';

@freezed
class ScanModel with _$ScanModel {
  const factory ScanModel() = _ScanModel;
}
