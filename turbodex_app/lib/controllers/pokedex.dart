import 'package:flutter/foundation.dart';
import '../repositories/pokedex_repository.dart';

class PokedexController extends ChangeNotifier {
  final PokedexRepository dex;
  PokedexController(this.dex);

  int get total => dex.total;
  int get found => dex.found;
}
