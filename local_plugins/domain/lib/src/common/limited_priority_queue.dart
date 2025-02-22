// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show PriorityQueue;
import 'package:domain/src/common/const.dart';
import 'package:domain/src/contract/common/limited_priority_queue_mixin.dart';

class LimitedPriorityQueue<T> implements LimitedPriorityQueueMixin<T> {
  final QueueDeleteListenerMixin<T> _deleteListener;

  @override
  final int maxItemsLength;

  final PriorityQueue<PriorityWrapper<T>> _priorityQueue;

  LimitedPriorityQueue(
    QueueDeleteListenerMixin<T> deleteListener,
    int maxItemsLength,
  )   : maxItemsLength = maxItemsLength >= 1 ? maxItemsLength : 1,
        _deleteListener = deleteListener,
        _priorityQueue = PriorityQueue<PriorityWrapper<T>>(
            (pr1, pr2) => pr1.priority.compareTo(pr2.priority));

  @override
  void addToQueue(PriorityWrapper<T> priorityWrapper) {
    if (_priorityQueue.length >= maxItemsLength) {
      // Do not working correctly without 'toSet' call
      final deletedElement = _priorityQueue.toSet().first;
      _priorityQueue.remove(deletedElement);
      _deleteListener.wasDeletedFromQueue(deletedElement.element);
    }
    _priorityQueue.add(priorityWrapper);
  }

  @override
  void clear() {
    _priorityQueue.clear();
  }

  @override
  void deleteFromQueue(PriorityWrapper<T> elementWrapper) {
    if (_priorityQueue.remove(elementWrapper)) {
      _deleteListener.wasDeletedFromQueue(elementWrapper.element);
    }
  }
}

class PriorityWrapper<T> implements PriorityWrapperMixin {
  static const _startsPriority = 0;

  int priority = _startsPriority;
  @override
  final T element;

  PriorityWrapper(this.element);

  @override
  void incPriority() {
    if (priority + 1 >= maxSafeNativeInt) {
      priority = maxSafeNativeInt;
    } else {
      priority++;
    }
  }
}
