part of '../asp.dart';

/// An RxList gives you a deeper level of observability on a list of values.
/// It tracks when items are added, removed or modified and notifies the observers.
///
/// Use an RxList when a change in the list matters.
class RxList<T> extends ChangeNotifier
    with ListMixin<T>
    implements RxValueListenable<RxList<T>> {
  late final List<T> _list;

  /// Creates a [RxList] that may be initialized with a [list].
  /// {@tool snippet}
  /// ```dart
  /// final list = RxList(['jacob', 'sara']);
  /// ```
  /// {@end-tool}
  RxList([List<T>? list]) {
    if (list != null) {
      _list = list;
    } else {
      _list = [];
    }
  }

  @override
  int get length {
    _rxMainContext.reportRead(this);
    return _list.length;
  }

  @override
  T get first {
    _rxMainContext.reportRead(this);
    return _list.first;
  }

  @override
  T get last {
    _rxMainContext.reportRead(this);
    return _list.last;
  }

  @override
  Iterable<T> get reversed {
    _rxMainContext.reportRead(this);
    return _list.reversed;
  }

  @override
  bool get isEmpty {
    _rxMainContext.reportRead(this);
    return _list.isEmpty;
  }

  @override
  bool get isNotEmpty {
    _rxMainContext.reportRead(this);
    return _list.isNotEmpty;
  }

  @override
  Iterator<T> get iterator {
    _rxMainContext.reportRead(this);
    return _list.iterator;
  }

  @override
  T get single {
    _rxMainContext.reportRead(this);
    return _list.single;
  }

  @override
  Iterable<T> getRange(int start, int end) {
    _rxMainContext.reportRead(this);
    return _list.getRange(start, end);
  }

  @override
  void replaceRange(int start, int end, Iterable<T> newContents) {
    _list.replaceRange(start, end, newContents);
    notifyListeners();
  }

  @override
  void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
    _list.setRange(start, end, iterable, skipCount);
    notifyListeners();
  }

  @override
  void fillRange(int start, int end, [T? fill]) {
    _list.fillRange(start, end, fill);
    notifyListeners();
  }

  @override
  void add(T element) {
    _list.add(element);
    notifyListeners();
  }

  @override
  void addAll(Iterable<T> iterable) {
    _list.addAll(iterable);
    notifyListeners();
  }

  @override
  bool remove(covariant T element) {
    final removed = _list.remove(element);
    if (removed) {
      notifyListeners();
    }
    return removed;
  }

  @override
  T removeAt(int index) {
    final removed = _list.removeAt(index);
    notifyListeners();
    return removed;
  }

  @override
  T removeLast() {
    final removed = _list.removeLast();
    notifyListeners();
    return removed;
  }

  @override
  void removeRange(int start, int end) {
    _list.removeRange(start, end);
    notifyListeners();
  }

  @override
  void removeWhere(bool Function(T) test) {
    _list.removeWhere(test);
    notifyListeners();
  }

  @override
  void insert(int index, T element) {
    _list.insert(index, element);
    notifyListeners();
  }

  @override
  void insertAll(int index, Iterable<T> iterable) {
    _list.insertAll(index, iterable);
    notifyListeners();
  }

  @override
  void setAll(int index, Iterable<T> iterable) {
    _list.setAll(index, iterable);
    notifyListeners();
  }

  @override
  void shuffle([Random? random]) {
    _list.shuffle(random);
    notifyListeners();
  }

  @override
  void sort([int Function(T, T)? compare]) {
    _list.sort(compare);
    notifyListeners();
  }

  @override
  List<T> sublist(int start, [int? end]) {
    _rxMainContext.reportRead(this);
    return _list.sublist(start, end);
  }

  @override
  T singleWhere(bool Function(T) test, {T Function()? orElse}) {
    _rxMainContext.reportRead(this);
    return _list.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<T> skip(int count) {
    _rxMainContext.reportRead(this);
    return _list.skip(count);
  }

  @override
  Iterable<T> skipWhile(bool Function(T) test) {
    _rxMainContext.reportRead(this);
    return _list.skipWhile(test);
  }

  @override
  void forEach(void Function(T) action) {
    _rxMainContext.reportRead(this);
    _list.forEach(action);
  }

  @override
  void clear() {
    _list.clear();
    notifyListeners();
  }

  /// Creates a [RxList] from a [list].
  /// {@tool snippet}
  /// ```dart
  /// final list = RxList.of(['jacob', 'sara']);
  /// ```
  /// {@end-tool}
  static RxList<T> of<T>(List<T> list) => RxList<T>(list);

  @override
  List<T> operator +(List<T> other) {
    final newList = _list + other;
    _rxMainContext.reportRead(this);
    return newList;
  }

  @override
  T operator [](int index) {
    _rxMainContext.reportRead(this);
    return _list[index];
  }

  @override
  void operator []=(int index, T value) {
    _list[index] = value;
    notifyListeners();
  }

  @override
  set length(int value) {
    _list.length = value;
    notifyListeners();
  }

  @override
  Future<RxList<T>> next(
    Function onAction, {
    Duration timeLimit = const Duration(seconds: 10),
  }) {
    return rxNext<RxList<T>>(
      this,
      onAction: onAction,
      timeLimit: timeLimit,
    );
  }

  @override
  RxList<T> get value {
    _rxMainContext.reportRead(this);
    return this;
  }
}
