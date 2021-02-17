import 'package:dataclass/dataclass.dart';

part 'queue_model.g.dart';

@dataClass
class QueueModel extends _$QueueModel {
    final String queue;
    final String channel;

    QueueModel({this.queue, this.channel});
}