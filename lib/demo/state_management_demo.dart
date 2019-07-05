import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  VoidCallback _increaseCallback() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StateManagementDemo"),
        elevation: 0.0,
      ),
//      body: Center(
//        child: Chip(
//          label: Text('$_count'),
//        ),
//      ),
//    body: Counter1Level(_count),
      body: Center(
        child: Column(
          children: <Widget>[
            CounterWraper(_count, _increaseCallback),
            CounterProvider(
              child: Counter1Level(_count),
              increaseCallback: _increaseCallback,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
          debugPrint('$_count');
        },
      ),
    );
  }
}

// 将数据从父级传递到 Counter
class Counter1Level extends StatelessWidget {
  final int _count;

  Counter1Level(this._count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$_count'),
      ),
    );
  }
}

// 数据从父级传递到 CounterWraper 再传递到 Counter
class CounterWraper extends StatelessWidget {
  final int _count;

  final VoidCallback _increaseCallback;

  CounterWraper(this._count, this._increaseCallback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Counter2Level(_count, _increaseCallback),
    );
  }
}

class Counter2Level extends StatelessWidget {
  final int _count;

  final VoidCallback _increasementCallback;

  Counter2Level(this._count, this._increasementCallback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$_count'),
        onPressed: _increasementCallback,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCallback;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCallback,
    this.child,
  }):super(child:child);

  static CounterProvider of(BuildContext context)=>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}





// 位于 CounterProvider 组件下的无状态组件，可以直接获取到 CounterProvider 的数据
class Counter3Inherited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int _count = CounterProvider.of(context).count;
    final VoidCallback _increaseCallback = CounterProvider.of(context).increaseCallback;

    return Container(
      child: ActionChip(
        label: Text('$_count'),
        onPressed: _increaseCallback,
      ),
    );
  }
}

// 这个 demo 中，数据都放在 CounterModel 中统一管理，组件本身只需要是 Stateless 类型的
class StateManagementDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo2'),
          elevation: 0.0,
        ),
        body: CounterWraper3(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model)=>FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

class CounterWraper3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter3(),
    );
  }
}

class Counter3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model)=>ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count=>_count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}

