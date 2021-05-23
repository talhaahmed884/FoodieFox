class SubOption {
  int itemId;
  String name;
  String price;

  SubOption({this.itemId, this.name, this.price});

  static List<SubOption> getSubOptions() {
    return <SubOption>[
      SubOption(itemId: 0, name: "Fajita Sicillian", price: "+ R.s 0.00"),
      SubOption(itemId: 0, name: "Afghan Tikka", price: "+ R.s 0.00"),
      SubOption(itemId: 0, name: "BBQ Buzz", price: "+ R.s 0.00"),
      SubOption(itemId: 0, name: "Spicy Ranch", price: "+ R.s 0.00"),
      SubOption(itemId: 0, name: "Super Sicilian", price: "+ R.s 0.00"),
    ];
  }
}
