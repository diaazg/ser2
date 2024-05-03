abstract class FilterEvnet {}

class SetOption extends FilterEvnet {
    final String prop;
  final bool val ;

  SetOption({required this.prop, required this.val});
}

class InitWilayaList extends FilterEvnet {}

class SetWilaya extends FilterEvnet {
  final String choosenWilaya ;

  SetWilaya({required this.choosenWilaya});
}