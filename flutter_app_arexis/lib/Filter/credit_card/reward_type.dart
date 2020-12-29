
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> reward_type = [
  "Asia miles",
  "Cash Back",
  "Points"
];
List<String> selectedChoices_reward_type = [];
class MultiSelectChip_reward_type extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_reward_type(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_reward_type createState() => _MultiSelectChip_reward_type();
}
class _MultiSelectChip_reward_type extends State<MultiSelectChip_reward_type> {
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
          selected: selectedChoices_reward_type.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_reward_type.contains(item)
                  ? selectedChoices_reward_type.remove(item)
                  : selectedChoices_reward_type.add(item);
              widget.onSelectionChanged(selectedChoices_reward_type); // +added
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


class display_selectedChoices_reward_type extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_selectedChoices_reward_type(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_selectedChoices_reward_type createState() => _display_selectedChoices_reward_type();
}
class _display_selectedChoices_reward_type extends State<display_selectedChoices_reward_type> {
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