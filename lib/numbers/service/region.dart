enum Region {
  all,
  wien,
  niederoesterreich,
  oberoesterreich,
  burgenland,
  steiermark,
  kaertnen,
  tirol,
  vorarlberg,
  salzburg
}

extension RegionNames on Region {
  String get name {
    switch (this) {
      case Region.all:
        return 'Österreich';
      case Region.wien:
        return 'Wien';
      case Region.niederoesterreich:
        return 'Niederösterreich';
      case Region.oberoesterreich:
        return 'Oberösterreich';
      case Region.burgenland:
        return 'Burgenland';
      case Region.steiermark:
        return 'Steiermark';
      case Region.kaertnen:
        return 'Kärnten';
      case Region.tirol:
        return 'Tirol';
      case Region.vorarlberg:
        return 'Vorarlberg';
      case Region.salzburg:
        return 'Salzburg';
    }
  }
}
