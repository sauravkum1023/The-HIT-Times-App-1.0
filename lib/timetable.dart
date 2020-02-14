import 'package:flutter/material.dart';

class Item{
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numOfItems){
  return List.generate(numOfItems, (int index){
    return Item(
      headerValue: 'Dept $index',
      expandedValue: 'Year : $index',
    );
  });
}

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
    );
  }

  Widget _buildPanel(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded){
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('To delete this panel, tap trash can icon'),
            trailing: Icon(Icons.delete_sweep),
            onTap: (){
              setState(() {
                _data.retainWhere((currentItem) => item == currentItem);
              });
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

