import 'package:forecast_flutter/utils/ValueHelper.dart';

class CurrentWeatherModel {
  String cod;
  double message;
  double cnt;
  List<ListWeather> list;
  City city;

  CurrentWeatherModel({this.cod, this.message, this.cnt, this.list, this.city});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = ValueHelper.getDouble(json['message']);
    cnt = ValueHelper.getDouble(json['cnt']);
    if (json['list'] != null) {
      list = new List<ListWeather>();
      json['list'].forEach((v) {
        list.add(new ListWeather.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    return data;
  }
}

class ListWeather {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  Snow snow;
  Sys sys;
  String dtTxt;

  ListWeather(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.snow,
      this.sys,
      this.dtTxt});

  ListWeather.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    snow = json['snow'] != null ? new Snow.fromJson(json['snow']) : null;
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.main != null) {
      data['main'] = this.main.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }
    if (this.snow != null) {
      data['snow'] = this.snow.toJson();
    }
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    return data;
  }
}

class Main {
  double temp;
  double tempMin;
  double tempMax;
  double pressure;
  double seaLevel;
  double grndLevel;
  double humidity;
  double tempKf;

  Main(
      {this.temp,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = ValueHelper.getDouble(json['temp']);
    tempMin = ValueHelper.getDouble(json['temp_min']);
    tempMax = ValueHelper.getDouble(json['temp_max']);
    pressure = ValueHelper.getDouble(json['pressure']);
    seaLevel = ValueHelper.getDouble(json['sea_level']);
    grndLevel = ValueHelper.getDouble(json['grnd_level']);
    humidity = ValueHelper.getDouble(json['humidity']);
    tempKf = ValueHelper.getDouble(json['temp_kf']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['sea_level'] = this.seaLevel;
    data['grnd_level'] = this.grndLevel;
    data['humidity'] = this.humidity;
    data['temp_kf'] = this.tempKf;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Wind {
  double speed;
  double deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = ValueHelper.getDouble(json['speed']);
    deg = ValueHelper.getDouble(json['deg']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}

class Snow {
  double d3h;

  Snow({this.d3h});

  Snow.fromJson(Map<String, dynamic> json) {
    d3h = ValueHelper.getDouble(json['3h']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3h'] = this.d3h;
    return data;
  }
}

class Sys {
  String pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pod'] = this.pod;
    return data;
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;

  City({this.id, this.name, this.coord, this.country});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    return data;
  }
}

class Coord {
  double lat;
  double lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = ValueHelper.getDouble(json['lat']);
    lon = ValueHelper.getDouble(json['lon']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}


