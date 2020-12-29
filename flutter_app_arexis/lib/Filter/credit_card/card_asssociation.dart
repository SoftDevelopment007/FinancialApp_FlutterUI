
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> card_association = [
  "American Express",
  "JCB",
  "Mastercard",
  "UnionPay",
  "UnionPay Diamond",
  "UnionPay Platinum",
  "Visa",
  "Visa Gold",
  "Visa Platinum",
  "Visa Signature",
  "World Mastercard",
];
List<String> selectedChoices_card_association = [];
class MultiSelectChip_card_association extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_card_association(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_card_association createState() => _MultiSelectChip_card_association();
}
class _MultiSelectChip_card_association extends State<MultiSelectChip_card_association> {
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
          selected: selectedChoices_card_association.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_card_association.contains(item)
                  ? selectedChoices_card_association.remove(item)
                  : selectedChoices_card_association.add(item);
              widget.onSelectionChanged(selectedChoices_card_association); // +added
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


class display_selectedChoices_card_association extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_selectedChoices_card_association(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_selectedChoices_card_association createState() => _display_selectedChoices_card_association();
}
class _display_selectedChoices_card_association extends State<display_selectedChoices_card_association> {
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