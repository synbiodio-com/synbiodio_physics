import 'package:meta/meta.dart';

/// 质量单位
enum MassUnit {
  /// 纳克
  nanogram,

  /// 微克
  microgram,

  /// 毫克
  milligram,

  /// 克
  gram,

  /// 千克
  kilogram,
}

/// 质量
@immutable
class Mass implements Comparable<Mass> {
  /// 质量单位构造函数
  const Mass({
    int kilogram = 0,
    int gram = 0,
    int milligram = 0,
    int microgram = 0,
    int nanogram = 0,
  }) : this._nanogram(
          nanogram +
              microgram * nanogramsPerMicrogram +
              milligram * nanogramsPerMilligram +
              gram * nanogramsPerPerGram +
              kilogram * nanogramsPerPerKilogram,
        );

  /// 空质量
  const Mass.empty() : _nanogram = 0;

  const Mass._nanogram(this._nanogram);

  /// Every 1 microgram corresponds to 1000 nanograms.
  static const int nanogramsPerMicrogram = 1000;

  /// 每1毫克对应1000微克
  static const int microgramsPerMilligram = 1000;

  /// 每1克对应1000毫克
  static const int milligramsPerGram = 1000;

  /// 每1千克对应1000克
  static const int gramsPerKilogram = 1000;

  /// 每1毫克对应1000 * 1000纳克
  static const int nanogramsPerMilligram = nanogramsPerMicrogram * microgramsPerMilligram;

  /// 每1克对应1000 * 1000 * 1000纳克
  static const int nanogramsPerPerGram = nanogramsPerMilligram * milligramsPerGram;

  /// 每1千克对应1000 * 1000 * 1000 * 1000纳克
  static const int nanogramsPerPerKilogram = nanogramsPerPerGram * gramsPerKilogram;

  final int _nanogram;

  /// 用纳克单位表示
  double get inNanogram => _nanogram.toDouble();

  /// 用微克单位表示
  double get inMicrogram => _nanogram / nanogramsPerMicrogram;

  /// 用毫克单位表示
  double get inMilligram => _nanogram / nanogramsPerMilligram;

  /// 用克单位表示
  double get inGram => _nanogram / nanogramsPerPerGram;

  /// 用千克单位表示
  double get inKilogram => _nanogram / nanogramsPerPerKilogram;

  /// 质量相加
  Mass operator +(Mass other) => Mass._nanogram(_nanogram + other._nanogram);

  /// 质量相减
  Mass operator -(Mass other) => Mass._nanogram(_nanogram - other._nanogram);

  /// 质量相减
  Mass operator *(num factor) => Mass._nanogram((_nanogram * factor).round());

  ///  质量相除， 得到倍数
  double operator /(Mass other) => _nanogram / other._nanogram;

  @override
  bool operator ==(Object other) {
    if (other is! Mass) {
      return false;
    }
    return _nanogram == other._nanogram;
  }

  @override
  int get hashCode => _nanogram.hashCode;

  @override
  String toString() {
    return 'Weight($_nanogram ng)';
  }

  @override
  int compareTo(Mass other) => _nanogram.compareTo(other._nanogram);
}
