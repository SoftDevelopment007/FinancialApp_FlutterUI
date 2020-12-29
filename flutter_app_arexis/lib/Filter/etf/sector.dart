
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';

List<String> sector = [
  "Communication Services",
  "Utilities",
  "Financial Services",
  "Basic Materials",
  "Energy",
   "Technology", "Real Estate", "Healthcare", "Consumer Defensive", "Industrials", "Consumer Cyclical", "Health Care","Others","Other financials", "Consumer Staples", "Financials", "Materials", "Cash and Others" ,"Consumer Discretionary", "Communication", "Cash", "Information Technology", "Properties & Construction", "Conglomerates", "Telecommunications", "Corporates", "Government", "Health care",  "Consumer goods", "Insurance", "Basic materials", "Banks", "Real estate", "Finance", "Telecommunication Services", "Cash & DerivativesOthers",
];
List<String> selectedChoices_sector = [];
class MultiSelectChip_sector extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip_sector(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChip_sector createState() => _MultiSelectChip_sector();
}
class _MultiSelectChip_sector extends State<MultiSelectChip_sector> {
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
          label: Text(item,style: TextStyle(fontSize: 16,color:Colors.white ),),
          selected: selectedChoices_sector.contains(item),
          selectedColor: kBackgoundColor39 ,
          onSelected: (selected) {
            setState(() {
              selectedChoices_sector.contains(item)
                  ? selectedChoices_sector.remove(item)
                  : selectedChoices_sector.add(item);
              widget.onSelectionChanged(selectedChoices_sector); // +added
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


class display_MultiSelectChip_sector extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  display_MultiSelectChip_sector(
      this.reportList,
      {this.onSelectionChanged} // +added
      );
  @override
  _display_MultiSelectChip_sector createState() => _display_MultiSelectChip_sector();
}
class _display_MultiSelectChip_sector extends State<display_MultiSelectChip_sector> {
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