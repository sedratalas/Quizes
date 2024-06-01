class LazyLoading <T>{
  T? _data;
  T Function()? _loadData;
  LazyLoading(this._loadData);

  T get data {
    if (_data == null) {
      _data = _loadData!();
    }
    return _data!;
  }
}