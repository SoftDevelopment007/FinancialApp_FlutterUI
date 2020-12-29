
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> term_period = [
  "Year",
  "Month",
  "Day",
  "Week",
];
List<String> selectedChoices_term_period = [];
class MultiSelectChip_term_period extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_term_period(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_term_period createState() => _MultiSelectChip_term_period();
}
class _MultiSelectChip_term_period extends State<MultiSelectChip_term_period> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        width: screenSize.width*0.6,
        margin:  EdgeInsets.only(right:screenSize.width/30 ),
        padding:  EdgeInsets.all(screenSize.width/100),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(side:BorderSide(width: 0,color:  Colors.grey.withAlpha(510)),borderRadius: BorderRadius.circular(screenSize.width/10)),
          backgroundColor:  Colors.grey.withAlpha(510),
          padding:  EdgeInsets.only(top:screenSize.width/50,bottom: screenSize.width/50,left: screenSize.width/30,right: screenSize.width/30),
          label: Text(item,style: TextStyle(fontSize: screenSize.width/20,color:Colors.white ),),
          selected: selectedChoices_term_period.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_term_period.contains(item)
                  ? selectedChoices_term_period.remove(item)
                  : selectedChoices_term_period.add(item);
              widget.onSelectionChanged(selectedChoices_term_period); // +added
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

class display_MultiSelectChip_term_period extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_MultiSelectChip_term_period(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_MultiSelectChip_term_period createState() => _display_MultiSelectChip_term_period();
}
class _display_MultiSelectChip_term_period extends State<display_MultiSelectChip_term_period> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
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