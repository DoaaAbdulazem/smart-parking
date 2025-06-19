import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

/// نموذج بيانات الموقع
class LocationData {
  final double latitude;
  final double longitude;
  final String? address;
  final String? name;
  final DateTime timestamp;

  LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
    this.name,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  LatLng get latLng => LatLng(latitude, longitude);

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'address': address,
    'name': name,
    'timestamp': timestamp.toIso8601String(),
  };

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
    latitude: json['latitude'].toDouble(),
    longitude: json['longitude'].toDouble(),
    address: json['address'],
    name: json['name'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}

/// نموذج بيانات الطريق
class RouteData {
  final List<LatLng> points;
  final double distance; // بالمتر
  final int duration; // بالثواني
  final String instructions;

  RouteData({
    required this.points,
    required this.distance,
    required this.duration,
    required this.instructions,
  });

  String get formattedDistance {
    if (distance < 1000) {
      return '${distance.toStringAsFixed(0)} م';
    } else {
      return '${(distance / 1000).toStringAsFixed(1)} كم';
    }
  }

  String get formattedDuration {
    final hours = duration ~/ 3600;
    final minutes = (duration % 3600) ~/ 60;

    if (hours > 0) {
      return '$hours ساعة $minutes دقيقة';
    } else {
      return '$minutes دقيقة';
    }
  }
}

/// نموذج بيانات العلامة
class CustomMarker {
  final String id;
  final LatLng position;
  final String? title;
  final String? description;
  final IconData icon;
  final Color color;
  final double size;
  final Map<String, dynamic>? data;

  CustomMarker({
    required this.id,
    required this.position,
    this.title,
    this.description,
    this.icon = Icons.location_pin,
    this.color = Colors.red,
    this.size = 40.0,
    this.data,
  });
}

/// إعدادات الخريطة
class MapSettings {
  final double minZoom;
  final double maxZoom;
  final double initialZoom;
  final LatLng? initialCenter;
  final bool enableRotation;
  final bool enableScrollWheel;
  final bool showMyLocation;
  final bool followMyLocation;
  final String tileLayer;

  MapSettings({
    this.minZoom = 1.0,
    this.maxZoom = 18.0,
    this.initialZoom = 13.0,
    this.initialCenter,
    this.enableRotation = true,
    this.enableScrollWheel = true,
    this.showMyLocation = true,
    this.followMyLocation = false,
    this.tileLayer =
        ' https://basemaps.cartocdn.com/light_all/%7Bz%7D/%7Bx%7D/%7By%7D.png',
  });
}

/// خدمة الخرائط الشاملة
class FlutterMapService {
  static final FlutterMapService _instance = FlutterMapService._internal();
  factory FlutterMapService() => _instance;
  FlutterMapService._internal();

  final MapController _mapController = MapController();
  final StreamController<LocationData> _locationStreamController =
      StreamController<LocationData>.broadcast();
  final StreamController<List<CustomMarker>> _markersStreamController =
      StreamController<List<CustomMarker>>.broadcast();

  Timer? _locationTimer;
  LocationData? _currentLocation;
  final List<CustomMarker> _markers = [];
  final List<RouteData> _routes = [];
  MapSettings _settings = MapSettings();

  // Getters
  MapController get mapController => _mapController;
  Stream<LocationData> get locationStream => _locationStreamController.stream;
  Stream<List<CustomMarker>> get markersStream =>
      _markersStreamController.stream;
  LocationData? get currentLocation => _currentLocation;
  List<CustomMarker> get markers => List.unmodifiable(_markers);
  List<RouteData> get routes => List.unmodifiable(_routes);
  MapSettings get settings => _settings;

  /// تهيئة الخدمة
  Future<void> initialize({MapSettings? settings}) async {
    if (settings != null) {
      _settings = settings;
    }

    await _requestLocationPermission();

    if (_settings.showMyLocation) {
      await getCurrentLocation();
    }
  }

  Future<void> initializeAndMoveToCurrent() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception("Location services disabled");

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied)
          throw Exception("Permission denied");
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Permission permanently denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng current = LatLng(position.latitude, position.longitude);
      mapController.move(current, 15);
    } catch (e) {
      print("❌ Failed to move to current location: \$e");
    }
  }

  /// طلب إذن الموقع
  Future<bool> _requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('خدمة الموقع غير مفعلة');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('تم رفض إذن الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('تم رفض إذن الموقع نهائياً');
    }

    return true;
  }

  /// الحصول على الموقع الحالي
  Future<LocationData> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final LocationData location = LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      _currentLocation = location;
      _locationStreamController.add(location);

      return location;
    } catch (e) {
      throw Exception('فشل في الحصول على الموقع: $e');
    }
  }

  /// تتبع الموقع المباشر
  void startLocationTracking({Duration interval = const Duration(seconds: 5)}) {
    _locationTimer?.cancel();
    _locationTimer = Timer.periodic(interval, (timer) async {
      try {
        await getCurrentLocation();
      } catch (e) {
        debugPrint('خطأ في تتبع الموقع: $e');
      }
    });
  }

  /// إيقاف تتبع الموقع
  void stopLocationTracking() {
    _locationTimer?.cancel();
    _locationTimer = null;
  }

  /// الانتقال إلى موقع معين
  void moveToLocation(LatLng location, {double? zoom}) {
    _mapController.move(location, zoom ?? _settings.initialZoom);
  }

  /// الانتقال إلى الموقع الحالي
  Future<void> moveToCurrentLocation({double? zoom}) async {
    if (_currentLocation == null) {
      await getCurrentLocation();
    }

    if (_currentLocation != null) {
      moveToLocation(_currentLocation!.latLng, zoom: zoom);
    }
  }

  /// البحث عن موقع بالاسم
  Future<List<LocationData>> searchLocation(String query) async {
    try {
      final List<Location> locations = await locationFromAddress(query);

      final List<LocationData> results = [];

      for (final location in locations) {
        final address = await getAddressFromCoordinates(
          location.latitude,
          location.longitude,
        );

        results.add(
          LocationData(
            latitude: location.latitude,
            longitude: location.longitude,
            address: address,
            name: query,
          ),
        );
      }

      return results;
    } catch (e) {
      throw Exception('فشل في البحث عن الموقع: $e');
    }
  }

  /// الحصول على العنوان من الإحداثيات
  Future<String> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        return '${place.street ?? ''} ${place.locality ?? ''} ${place.country ?? ''}';
      }

      return 'موقع غير محدد';
    } catch (e) {
      return 'خطأ في تحديد العنوان';
    }
  }

  /// إضافة علامة
  void addMarker(CustomMarker marker) {
    _markers.add(marker);
    _markersStreamController.add(_markers);
  }

  /// إضافة عدة علامات
  void addMarkers(List<CustomMarker> markers) {
    _markers.addAll(markers);
    _markersStreamController.add(_markers);
  }

  /// حذف علامة
  void removeMarker(String markerId) {
    _markers.removeWhere((marker) => marker.id == markerId);
    _markersStreamController.add(_markers);
  }

  /// مسح جميع العلامات
  void clearMarkers() {
    _markers.clear();
    _markersStreamController.add(_markers);
  }

  /// البحث عن علامة
  CustomMarker? findMarker(String markerId) {
    try {
      return _markers.firstWhere((marker) => marker.id == markerId);
    } catch (e) {
      return null;
    }
  }

  /// حساب المسافة بين نقطتين
  double calculateDistance(LatLng point1, LatLng point2) {
    return Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }

  /// حساب المسافة من الموقع الحالي
  double? calculateDistanceFromCurrentLocation(LatLng destination) {
    if (_currentLocation == null) return null;

    return calculateDistance(_currentLocation!.latLng, destination);
  }

  /// الحصول على الطريق بين نقطتين (مبسط)
  Future<RouteData> getRoute(LatLng start, LatLng end) async {
    try {
      // هذا مثال مبسط - يمكنك استخدام OpenRouteService أو أي API آخر
      final distance = calculateDistance(start, end);
      final duration = (distance / 50 * 60).round(); // سرعة تقديرية 50 كم/ساعة

      // خط مستقيم بسيط (يمكنك تحسينه باستخدام routing API)
      final List<LatLng> points = [start, end];

      final route = RouteData(
        points: points,
        distance: distance,
        duration: duration,
        instructions: 'طريق مباشر من نقطة البداية إلى نقطة النهاية',
      );

      _routes.add(route);
      return route;
    } catch (e) {
      throw Exception('فشل في الحصول على الطريق: $e');
    }
  }

  /// مسح جميع الطرق
  void clearRoutes() {
    _routes.clear();
  }

  /// الحصول على العلامات القريبة
  List<CustomMarker> getNearbyMarkers(LatLng center, double radiusInMeters) {
    return _markers.where((marker) {
      final distance = calculateDistance(center, marker.position);
      return distance <= radiusInMeters;
    }).toList();
  }

  /// الحصول على حدود الخريطة
  LatLngBounds calculateBounds(List<LatLng> points) {
    if (points.isEmpty) {
      return LatLngBounds(const LatLng(0, 0), const LatLng(0, 0));
    }

    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final point in points) {
      minLat = math.min(minLat, point.latitude);
      maxLat = math.max(maxLat, point.latitude);
      minLng = math.min(minLng, point.longitude);
      maxLng = math.max(maxLng, point.longitude);
    }

    return LatLngBounds(LatLng(minLat, minLng), LatLng(maxLat, maxLng));
  }

  /// ضبط الخريطة لتظهر جميع العلامات
  void fitMarkersInView({EdgeInsets padding = const EdgeInsets.all(50)}) {
    if (_markers.isEmpty) return;

    final List<LatLng> points = _markers.map((m) => m.position).toList();
    final bounds = calculateBounds(points);

    // حساب النقطة المركزية والزوم المناسب
    final center = LatLng(
      (bounds.north + bounds.south) / 2,
      (bounds.east + bounds.west) / 2,
    );

    // حساب الزوم بناءً على المسافة
    final distance = calculateDistance(
      LatLng(bounds.north, bounds.west),
      LatLng(bounds.south, bounds.east),
    );

    double zoom = 10.0;
    if (distance < 1000) {
      zoom = 16.0;
    } else if (distance < 5000) {
      zoom = 14.0;
    } else if (distance < 20000) {
      zoom = 12.0;
    } else {
      zoom = 10.0;
    }

    _mapController.move(center, zoom);
  }

  /// تحويل الإحداثيات إلى نص
  String formatCoordinates(LatLng latLng) {
    return '${latLng.latitude.toStringAsFixed(6)}, ${latLng.longitude.toStringAsFixed(6)}';
  }

  /// نسخ الإحداثيات إلى الحافظة
  Future<void> copyCoordinatesToClipboard(LatLng latLng) async {
    final coordinates = formatCoordinates(latLng);
    await Clipboard.setData(ClipboardData(text: coordinates));
  }

  /// تحديث إعدادات الخريطة
  void updateSettings(MapSettings newSettings) {
    _settings = newSettings;
  }

  /// الحصول على قائمة طبقات الخرائط المختلفة
  static List<MapLayer> getAvailableLayers() {
    return [
      MapLayer(
        name: 'OpenStreetMap',
        url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        attribution: '© OpenStreetMap contributors',
      ),
      MapLayer(
        name: 'Satellite',
        url:
            'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
        attribution: '© Esri',
      ),
      MapLayer(
        name: 'Terrain',
        url:
            'https://stamen-tiles-{s}.a.ssl.fastly.net/terrain/{z}/{x}/{y}.jpg',
        attribution: '© Stamen Design',
      ),
    ];
  }

  /// تنظيف الموارد
  void dispose() {
    _locationTimer?.cancel();
    _locationStreamController.close();
    _markersStreamController.close();
  }
}

/// نموذج طبقة الخريطة
class MapLayer {
  final String name;
  final String url;
  final String attribution;

  MapLayer({required this.name, required this.url, required this.attribution});
}

/// ويدجت الخريطة المخصصة
class CustomMapWidget extends StatefulWidget {
  final MapSettings? settings;
  final List<CustomMarker>? initialMarkers;
  final Function(LatLng)? onTap;
  final Function(CustomMarker)? onMarkerTap;
  final Function(LatLng)? onLongPress;
  final Widget? floatingActionButton;

  const CustomMapWidget({
    super.key,
    this.settings,
    this.initialMarkers,
    this.onTap,
    this.onMarkerTap,
    this.onLongPress,
    this.floatingActionButton,
  });

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  final FlutterMapService _mapService = FlutterMapService();
  late MapSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = widget.settings ?? MapSettings();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      await _mapService.initialize(settings: _settings);

      if (widget.initialMarkers != null) {
        _mapService.addMarkers(widget.initialMarkers!);
      }
    } catch (e) {
      debugPrint('خطأ في تهيئة الخريطة: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapService.mapController,
            options: MapOptions(
              initialCenter:
                  _settings.initialCenter ??
                  const LatLng(30.0444, 31.2357), // القاهرة
              initialZoom: _settings.initialZoom,
              minZoom: _settings.minZoom,
              maxZoom: _settings.maxZoom,
              onTap: (tapPosition, point) {
                widget.onTap?.call(point);
              },
              onLongPress: (tapPosition, point) {
                widget.onLongPress?.call(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: _settings.tileLayer,
                userAgentPackageName: 'com.example.app',
              ),
              StreamBuilder<List<CustomMarker>>(
                stream: _mapService.markersStream,
                builder: (context, snapshot) {
                  final markers = snapshot.data ?? [];
                  return MarkerLayer(
                    markers:
                        markers
                            .map(
                              (marker) => Marker(
                                point: marker.position,
                                width: marker.size,
                                height: marker.size,
                                child: GestureDetector(
                                  onTap: () => widget.onMarkerTap?.call(marker),
                                  child: Icon(
                                    marker.icon,
                                    color: marker.color,
                                    size: marker.size,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  );
                },
              ),
              if (_settings.showMyLocation)
                StreamBuilder<LocationData>(
                  stream: _mapService.locationStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const SizedBox.shrink();

                    return MarkerLayer(
                      markers: [
                        Marker(
                          point: snapshot.data!.latLng,
                          width: 20,
                          height: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
          if (widget.floatingActionButton != null)
            Positioned(
              bottom: 16,
              right: 16,
              child: widget.floatingActionButton!,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapService.dispose();
    super.dispose();
  }
}
