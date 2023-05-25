enum FilterType {
  Type(2, 'Choose type'),
  Location(1, 'Choose City & Area'),
  Price(0, 'Choose price range');

  final int id;
  final String title;

  const FilterType(this.id, this.title);
}
