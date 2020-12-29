import 'package:flutter/material.dart';


class filterProvider extends ChangeNotifier{

  int step=0;
bool k1=false;
void change1(){
  step=1; k1=true;notifyListeners();
}
bool k2=false;
void change2(){
  step=2;k2=true;notifyListeners();
}
bool k3=false;
void change3(){
  step=3;k3=true;notifyListeners();
}
bool k4=false;
void change4(){
  step=4;k4=true;notifyListeners();
}
bool region_flag=false;
void change_region_flag(){
  region_flag=!(region_flag);notifyListeners();
}
  bool asset_class_flag=false;
  void change_asset_class_flag(){
    asset_class_flag=!(asset_class_flag);notifyListeners();
  }
  bool sector_flag=false;
  void change_sector_flag(){
    sector_flag=!(sector_flag);notifyListeners();
  }
  bool card_association_flag=false;
  void change_card_association_flag(){
    card_association_flag=!(card_association_flag);notifyListeners();
  }
  bool reward_type_flag=false;
  void change_reward_type_flag(){
    reward_type_flag=!(reward_type_flag);notifyListeners();
  }
  bool feature_flag=false;
  void change_feature_flag(){
    feature_flag=!(feature_flag);notifyListeners();
  }
  bool term_period_flag=false;
  void change_term_period_flag(){
    term_period_flag=!(term_period_flag);notifyListeners();
  }
  bool currency_flag=false;
  void change_currency_flag(){
    currency_flag=!(currency_flag);notifyListeners();
  }
  void newstep(){
    step=0;k1=false;k2=false;k3=false;notifyListeners();
  }

}