import 'package:foodiefox_customer/ui/details/subOption.dart';

class Details_Categories {
  String detail_name;
  String isrequired;
  List<SubOption> items;

  Details_Categories({this.detail_name, this.isrequired, this.items});

  static List<Details_Categories> getDetails_Categoriess() {
    return <Details_Categories>[
      Details_Categories(
        detail_name: "Choose Your Pizza",
        isrequired: "Required",
        items: SubOption.getSubOptions(),
      ),
      Details_Categories(
        detail_name: "Drinks",
        isrequired: "Optional",
        items: SubOption.getSubOptions(),
      ),
    ];
  }
}
