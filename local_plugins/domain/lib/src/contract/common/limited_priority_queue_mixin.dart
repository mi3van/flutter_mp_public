import 'package:domain/src/common/limited_priority_queue.dart';

mixin LimitedPriorityQueueMixin<T> {
  int get maxItemsLength;

  void addToQueue(PriorityWrapper<T> elementWrapper);

  void deleteFromQueue(PriorityWrapper<T> elementWrapper);

  void clear();
}

mixin PriorityWrapperMixin<T> {
  T get element;

  void incPriority();
}

mixin QueueDeleteListenerMixin<T> {
  wasDeletedFromQueue(T element);
}
