import 'package:flutter_monitor_queue/models/queue_model.dart';
import 'package:get/get.dart';

class CashierState extends GetxController {
    List<QueueModel> queue = [];
    bool isBlink = false;

    void updateQueue(QueueModel queueModel) {
        // ถ้ามีจำนวนคิวมากกว่าหรือเท่ากับ 10 ให้ลบคิวสุดท้ายออก
        if (queue.length >= 10) {
            queue.removeAt(queue.length - 1);
        }
        // ถ้ามีคิวซ้ำให้ลบคิวนั้นออก
        if (queue.contains(queueModel)) {
            queue.remove(queueModel);
        }
        // เพิ่มคิวปัจจุบันลงใน index 0
        queue.insert(0, queueModel);
        update();
    }

    void resetQueue() {
        queue = [];
        update();
    }

    void updateBlink(bool value) {
        isBlink = value;
        update();
    }
}