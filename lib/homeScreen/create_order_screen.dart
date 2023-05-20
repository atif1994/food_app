import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant/AppColors.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({Key? key}) : super(key: key);

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor,
        title: Text("Generate order"),
      ),
      body: ListView(children: <Widget>[
        Center(
            child: Text(
              'Your Order',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        DataTable(
          columnSpacing: 2.5,
          columns: [
            DataColumn(label: Text(
                'ID',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'Item Name',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'Measurement',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'add',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(TextFormField(

                decoration: InputDecoration(
                  hintText: " Enter product name",
                  hintStyle: TextStyle(
                      fontSize: 11
                  ),
                  border: InputBorder.none,
                ),
              )),
              DataCell(TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Enter product value",
                    hintStyle: TextStyle(
                        fontSize: 11
                    )
                ),
              )),
              DataCell(Icon(Icons.add)

              ),

            ]),


          ],
        ),
      ])

    );
  }
}
