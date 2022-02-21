import 'package:meta/meta.dart';
import 'dart:convert';

BeerJsonToData beerJsonToDataFromJson(String str) =>
    BeerJsonToData.fromJson(json.decode(str));
String beerJsonToDataToJson(BeerJsonToData data) => json.encode(data.toJson());

class BeerJsonToData {
  BeerJsonToData({
    required this.id,
    required this.name,
    required this.tagline,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    required this.ibu,
    required this.targetFg,
    required this.targetOg,
    required this.ebc,
    required this.srm,
    required this.ph,
    required this.attenuationLevel,
    required this.volume,
    required this.boilVolume,
    required this.method,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
    required this.contributedBy,
  });

  int id;
  String name;
  String tagline;
  String firstBrewed;
  String description;
  String imageUrl;
  double abv;
  int ibu;
  int targetFg;
  int targetOg;
  int ebc;
  int srm;
  double ph;
  int attenuationLevel;
  BoilVolume volume;
  BoilVolume boilVolume;
  Method method;
  Ingredients ingredients;
  List<String> foodPairing;
  String brewersTips;
  String contributedBy;

  factory BeerJsonToData.fromJson(Map<String, dynamic> json) => BeerJsonToData(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"].toDouble(),
        ibu: json["ibu"],
        targetFg: json["target_fg"],
        targetOg: json["target_og"],
        ebc: json["ebc"],
        srm: json["srm"],
        ph: json["ph"].toDouble(),
        attenuationLevel: json["attenuation_level"],
        volume: BoilVolume.fromJson(json["volume"]),
        boilVolume: BoilVolume.fromJson(json["boil_volume"]),
        method: Method.fromJson(json["method"]),
        ingredients: Ingredients.fromJson(json["ingredients"]),
        foodPairing: List<String>.from(json["food_pairing"].map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: json["contributed_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc,
        "srm": srm,
        "ph": ph,
        "attenuation_level": attenuationLevel,
        "volume": volume.toJson(),
        "boil_volume": boilVolume.toJson(),
        "method": method.toJson(),
        "ingredients": ingredients.toJson(),
        "food_pairing": List<dynamic>.from(foodPairing.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedBy,
      };
}

class BoilVolume {
  BoilVolume({
    required this.value,
    required this.unit,
  });

  double value;
  String unit;

  factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
        value: json["value"].toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}

class Ingredients {
  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  List<Malt> malt;
  List<Hop> hops;
  String yeast;

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        malt: List<Malt>.from(json["malt"].map((x) => Malt.fromJson(x))),
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromJson(x))),
        yeast: json["yeast"],
      );

  Map<String, dynamic> toJson() => {
        "malt": List<dynamic>.from(malt.map((x) => x.toJson())),
        "hops": List<dynamic>.from(hops.map((x) => x.toJson())),
        "yeast": yeast,
      };
}

class Hop {
  Hop({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  String name;
  BoilVolume amount;
  String add;
  String attribute;

  factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
        add: json["add"],
        attribute: json["attribute"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
        "add": add,
        "attribute": attribute,
      };
}

class Malt {
  Malt({
    required this.name,
    required this.amount,
  });

  String name;
  BoilVolume amount;

  factory Malt.fromJson(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
      };
}

class Method {
  Method({
    required this.mashTemp,
    required this.fermentation,
    required this.twist,
  });

  List<MashTemp> mashTemp;
  Fermentation fermentation;
  dynamic twist;

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        mashTemp: List<MashTemp>.from(
            json["mash_temp"].map((x) => MashTemp.fromJson(x))),
        fermentation: Fermentation.fromJson(json["fermentation"]),
        twist: json["twist"],
      );

  Map<String, dynamic> toJson() => {
        "mash_temp": List<dynamic>.from(mashTemp.map((x) => x.toJson())),
        "fermentation": fermentation.toJson(),
        "twist": twist,
      };
}

class Fermentation {
  Fermentation({
    required this.temp,
  });

  BoilVolume temp;

  factory Fermentation.fromJson(Map<String, dynamic> json) => Fermentation(
        temp: BoilVolume.fromJson(json["temp"]),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp.toJson(),
      };
}

class MashTemp {
  MashTemp({
    required this.temp,
    required this.duration,
  });

  BoilVolume temp;
  int duration;

  factory MashTemp.fromJson(Map<String, dynamic> json) => MashTemp(
        temp: BoilVolume.fromJson(json["temp"]),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp.toJson(),
        "duration": duration,
      };
}
