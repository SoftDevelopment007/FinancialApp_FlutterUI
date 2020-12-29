
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> feature = [
  "Dining",
  "Healthcare",
  "Home",
  "Leisure",
  "Shopping",
  "Student",
  "Transportation",
  "Travel",
  "Others"
];
List<String> selectedChoices_feature = [];
class MultiSelectChip_feature extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_feature(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_feature createState() => _MultiSelectChip_feature();
}
class _MultiSelectChip_feature extends State<MultiSelectChip_feature> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        width: screenSize.width*0.7,
        margin:  EdgeInsets.only(right:screenSize.width/30 ),
        padding:  EdgeInsets.all(screenSize.width/100),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(side:BorderSide(width: 0,color:  Colors.grey.withAlpha(510)),borderRadius: BorderRadius.circular(screenSize.width/10)),
          backgroundColor:  Colors.grey.withAlpha(510),
          padding:  EdgeInsets.only(top:screenSize.width/50,bottom: screenSize.width/50,left: screenSize.width/30,right: screenSize.width/30),
          label: Text(item,style: TextStyle(fontSize: screenSize.width/20,color:Colors.white ),),
          selected: selectedChoices_feature.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_feature.contains(item)
                  ? selectedChoices_feature.remove(item)
                  : selectedChoices_feature.add(item);
              widget.onSelectionChanged(selectedChoices_feature); // +added
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


class display_MultiSelectChip_feature extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_MultiSelectChip_feature(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_MultiSelectChip_feature createState() => _display_MultiSelectChip_feature();
}
class _display_MultiSelectChip_feature extends State<display_MultiSelectChip_feature> {
  _buildChoiceList() {
    var screenSize=MediaQuery.of(context).size;
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        margin:  EdgeInsets.only(right:screenSize.width/30 ),
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