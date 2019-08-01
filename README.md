# flutter_provider

这个 demo 介绍 flutter 状态管理的用法

- Provider<T>.value
- ChangeNotifierProvider<T>.value

里面一些小坑,比如 StreamBuilder 不使用你会发现也不报错,但是界面不更新

- ListenableProvider
- ChangeNotifierProvider
- ValueListenableProvider
- StreamProvider

## 解释下几种区别

1.ListenableProvider / ChangeNotifierProvider

- ListenableProvider 提供（provide）的对象是继承了 Listenable 抽象类的子类。由于无法混入，所以通过继承来获得 Listenable 的能力，同时必须实现其 addListener / removeListener 方法，手动管理收听者。显然，这样太过复杂，我们通常都不需要这样做。
- ChangeNotifierProvider 则更为简单，它能够对子节点提供一个 继承 / 混入 / 实现 了 ChangeNotifier 的类。通常我们只需要在 Model 中 with ChangeNotifier ，然后在需要刷新状态的时候调用 notifyListeners 即可。
  ChangeNotifierProvider 会在你需要的时候，自动调用其 \_disposer 方法,无需手动释放

2.ValueListenableProvider 用于提供实现了 继承 / 混入 / 实现 了 ValueListenable 的 Model。它实际上是专门用于处理只有一个单一变化数据的 ChangeNotifier,通过 ValueListenable 处理的类不再需要数据更新的时候调用 notifyListeners

3.StreamProvider 专门用作提供（provide）一条 Single Stream。我在这里仅对其核心属性进行讲解。

T initialData：你可以通过这个属性声明这条流的初始值。
ErrorBuilder<T> catchError：这个属性用来捕获流中的 error。在这条流 addError 了之后，你会能够通过 T Function(BuildContext context, Object error) 回调来处理这个异常数据。实际开发中它非常有用。
updateShouldNotify：和之前的回调一样，这里不再赘述。

除了这三个构造方法都有的属性以外，StreamProvider 还有三种不同的构造方法。

StreamProvider(...)：默认构造方法用作创建一个 Stream 并收听它。
StreamProvider.controller(...)：通过 builder 方式创建一个 StreamController<T>。并且在 StreamProvider 被移除时，自动释放 StreamController。
StreamProvider.value(...)：监听一个已有的 Stream 并将其 value 提供给子孙节点。
