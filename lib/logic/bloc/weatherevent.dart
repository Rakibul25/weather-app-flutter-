
abstract class weatherEvent{}
//defining event for blocs icon pressed
class SearchIconPressed extends weatherEvent{
  final String query;
  SearchIconPressed(this.query);
}


