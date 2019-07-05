import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeDemo extends StatefulWidget {
  @override
  _DatetimeDemoState createState() => _DatetimeDemoState();
}

class _DatetimeDemoState extends State<DatetimeDemo> {
  DateTime _selectedDatetime = DateTime.now();
  TimeOfDay _selectTime = TimeOfDay.now();

  Future<void> _selectDate () async {
    // showDatePicker 返回的是 Future 的 Datetime，Future 的结果是不能确定的
    // 因此需要使用 await 等待值的最终结果
    final DateTime date = await showDatePicker(context: context, initialDate: _selectedDatetime, firstDate: DateTime(1970), lastDate: DateTime(2100));
    // 最后的值如果为 null，则表示用户按了 cancel 按钮
    if (date == null)return;
    setState(() {
      _selectedDatetime = date;
    });
  }

  Future<void> _selectTimeHandle () async {
    final TimeOfDay time1 = await showTimePicker(context: context, initialTime: _selectTime);
    if (time1 == null) return;
    setState(() {
      _selectTime = time1;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatetimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: _selectDate,
              child: Row(
                children: <Widget>[
                  Text(DateFormat.yMd().format(_selectedDatetime)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            InkWell(
              onTap: _selectTimeHandle,
              child: Row(
                children: <Widget>[
                  Text(_selectTime.format(context)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
