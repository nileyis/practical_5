class Item{
  int id;
  String name;

  Item(this.id, this.name);
  int get itemId => id;
  String get itemName => name;

  @override
  String toString(){
    return '$id: $name';
  }
}