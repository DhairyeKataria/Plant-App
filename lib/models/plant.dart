class Plant {
  final String plantType;
  final String plantName;
  final double plantPrice;
  final String image;
  final double stars;
  final PlantMetrics metrics;

  Plant({
    required this.plantType,
    required this.plantName,
    required this.plantPrice,
    required this.image,
    required this.stars,
    required this.metrics,
  });
}

class PlantMetrics {
  final String height;
  final String humidity;
  final String width;

  PlantMetrics(this.height, this.humidity, this.width);
}
