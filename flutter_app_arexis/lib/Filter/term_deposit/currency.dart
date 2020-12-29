
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> currency = [
  "USD","EUR","CNY","CAD" ,"AUD","CHF","NZD", "HKD", "JPY","GBP","ZAR","THB"
];
List<String> selectedChoices_currency = [];
class MultiSelectChip_currency extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_currency(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_currency createState() => _MultiSelectChip_currency();
}
class _MultiSelectChip_currency extends State<MultiSelectChip_currency> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        margin:  EdgeInsets.only(right:screenSize.width/70 ),
        padding:  EdgeInsets.all(screenSize.width/100),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(side:BorderSide(width: 0,color:  Colors.grey.withAlpha(510)),borderRadius: BorderRadius.circular(screenSize.width/10)),
          backgroundColor:  Colors.grey.withAlpha(510),
          padding:  EdgeInsets.only(top:screenSize.width/50,bottom: screenSize.width/50,left: screenSize.width/30,right: screenSize.width/30),
          label: Text(item,style: TextStyle(fontSize: screenSize.width/20,color:Colors.white ),),
          selected: selectedChoices_currency.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_currency.contains(item)
                  ? selectedChoices_currency.remove(item)
                  : selectedChoices_currency.add(item);
              widget.onSelectionChanged(selectedChoices_currency); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class display_MultiSelectChip_currency extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_MultiSelectChip_currency(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_MultiSelectChip_currency createState() => _display_MultiSelectChip_currency();
}
class _display_MultiSelectChip_currency extends State<display_MultiSelectChip_currency> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        margin:  EdgeInsets.only(right:screenSize.width/70 ),
        padding:  EdgeInsets.all(screenSize.width/100),
        child: ChoiceChip(

          backgroundColor:  Colors.grey.withAlpha(510),
          padding:  EdgeInsets.only(top:screenSize.width/50,bottom: screenSize.width/50,left: screenSize.width/30,right: screenSize.width/30),
          label: Text(item,style: TextStyle(fontSize: screenSize.width/20,color:Colors.white ),),
          selected: true,
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}