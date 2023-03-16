
abstract class weatherEvent{}
//defining event for blocs icon pressed
class SearchIconPressed extends weatherEvent{
  final String query;
  SearchIconPressed(this.query);
}
class locatePressed extends weatherEvent{

}
class LocatePressed extends weatherEvent{
}



