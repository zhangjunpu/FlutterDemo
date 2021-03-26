import 'package:event_bus/event_bus.dart';

// 1. 创建全局EventBus对象
final eventBus = EventBus();

// 2. 发送Event事件 eventBus.fire(T)
// 3. 接收Event事件 eventBus.on<T>().listen((event) { ... })
