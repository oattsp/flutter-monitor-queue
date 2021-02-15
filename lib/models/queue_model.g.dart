// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_model.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$QueueModel {
  const _$QueueModel();

  String get queue;
  String get channel;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! QueueModel) return false;

    return true && this.queue == other.queue && this.channel == other.channel;
  }

  int get hashCode {
    return mapPropsToHashCode([queue, channel]);
  }

  String toString() {
    return 'QueueModel <\'queue\': ${this.queue},\'channel\': ${this.channel},>';
  }

  QueueModel copyWith({String queue, String channel}) {
    return QueueModel(
      queue: queue ?? this.queue,
      channel: channel ?? this.channel,
    );
  }
}
