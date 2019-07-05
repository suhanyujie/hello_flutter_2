import 'package:flutter/material.dart';
import 'form_demo.dart';
import 'popup_menu_demo.dart';
import 'checkbox_demo.dart';
import 'radio_demo.dart';
import 'switch_demo.dart';
import 'slider_demo.dart';
import 'datetime_demo.dart';
import 'simple_dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';
import 'chip_demo.dart';
import 'datatable_demo.dart';
import 'state_management_demo.dart';
import 'stream/stream_demo.dart';

class MaterialComponent extends StatefulWidget {
  @override
  _MaterialComponentState createState() => _MaterialComponentState();
}

class _MaterialComponentState extends State<MaterialComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('material component'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListItem(
              title: "FormDemo",
              page: FormDemo(),
            ),
            ListItem(
              title: "FloatingButtonDemo",
              page: FloatingActionButtonDemo(),
            ),
            SizedBox(
              width: 10.0,
            ),
            ListItem(
              title: "ButtonDemo",
              page: ButtonDemo(),
            ),
            ListItem(
              title: "PopupMenuDemo",
              page: PopupMenuDemo(),
            ),
            ListItem(
              title: "CheckBoxDemo",
              page: CheckBoxDemo(),
            ),
            ListItem(
              title: "RadioDemo",
              page: RadioDemo(),
            ),
            ListItem(
              title: "SwitchDemo",
              page: SwitchDemo(),
            ),
            ListItem(
              title: "SliderDemo",
              page: SliderDemo(),
            ),
            ListItem(
              title: "DatetimeDemo",
              page: DatetimeDemo(),
            ),
            ListItem(
              title: "SimpleDialogDemo",
              page: SimpleDialogDemo(),
            ),
            ListItem(
              title: "AlertDialogDemo",
              page: AlertDialogDemo(),
            ),
            ListItem(
              title: "BottomSheetDemo",
              page: BottomSheetDemo(),
            ),
            ListItem(
              title: "SnackBarDemo",
              page: SnackBarDemo(),
            ),
            ListItem(
              title: "ChipDemo",
              page: ChipDemo(),
            ),
            ListItem(
              title: "DatatableDemo",
              page: DatatableDemo(),
            ),
            ListItem(
              title: "StateManagementDemo",
              page: StateManagementDemo(),
            ),
            ListItem(
              title: "StateManage2",
              page: StateManagementDemo3(),
            ),
            ListItem(
              title: "StreamDemo",
              page: StreamDemo(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  final Widget _flatButtonDemo1 = FlatButton(
    onPressed: () {},
    child: Text('button 1'),
  );

  final Widget _flatButtonIconDemo1 = FlatButton.icon(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('图标按钮'),
    splashColor: Colors.grey,
  );
  // 带背景色的button
  final Widget _raiseButtonDemo = RaisedButton(
    onPressed: () {},
    child: Text('带背景色按钮'),
    splashColor: Colors.grey,
  );
  // 描边按钮
  final Widget _outlineBottomDemo = OutlineButton(
    onPressed: () {},
    child: Text('描边按钮'),
    borderSide: BorderSide(
      color: Colors.black,
    ),
    textColor: Colors.black,
    splashColor: Colors.grey,
  );
  // 自适应空间按钮
  final Widget _expendedButtonDemo = Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: OutlineButton(
          onPressed: () {},
          child: Text('自适应空间按钮 1'),
          splashColor: Colors.grey,
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: OutlineButton(
          onPressed: () {},
          child: Text('自适应空间按钮 2'),
          splashColor: Colors.grey,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    // 主题按钮
    Widget _themeButtonDemo = Theme(
      data: Theme.of(_context).copyWith(
        buttonColor: Theme.of(_context).accentColor,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      child: RaisedButton(
        onPressed: () {},
        child: Text('Button'),
        splashColor: Colors.grey,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('button demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _flatButtonDemo1,
            _flatButtonIconDemo1,
            _raiseButtonDemo,
            SizedBox(
              height: 5.0,
            ),
            _raiseButtonDemo,
            _themeButtonDemo,
            _outlineBottomDemo,
            _expendedButtonDemo,
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  Widget _floatActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
//    shape: BeveledRectangleBorder(
//      borderRadius: BorderRadius.circular(30.0),
//    ),
  );

  Widget _floatActionButtonExt1 = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('新增'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.arrow_forward),
          Row(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text('点击查看-$title',
                    style: TextStyle(

                    ),
                    textAlign: TextAlign.left,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
