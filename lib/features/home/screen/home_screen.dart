import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_project/core/services/map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterMapService _mapService = FlutterMapService();
  List<CustomMarker> _markers = [];
  bool _isLoading = true;
  LatLng? _initialCenter;

  final TextEditingController _searchController = TextEditingController();
  bool _showSearchResults = false;
  List<CustomMarker> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      await _getCurrentLocation();

      await _mapService.initialize(
        settings: MapSettings(
          initialCenter: _initialCenter,
          initialZoom: 15.0,
          showMyLocation: true,
        ),
      );

      _addInitialMarkers();
    } catch (e) {
      print("Error initializing map: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception("Location services disabled");

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Permission denied");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Permission permanently denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _initialCenter = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Failed to get current location: $e");

      setState(() {
        _initialCenter = const LatLng(30.0444, 31.2357); // القاهرة
      });
    }
  }

  void _addInitialMarkers() {
    final markers = [
      CustomMarker(
        id: '1',
        position: _initialCenter ?? const LatLng(30.0444, 31.2357),
        title: 'موقعك الحالي',
        description: 'أنت هنا',
        icon: Icons.person_pin_circle,
        color: Colors.blue,
      ),
      CustomMarker(
        id: '2',
        position: const LatLng(30.0131, 31.2089), // الجيزة
        title: 'أهرامات الجيزة',
        description: 'أحد عجائب الدنيا السبع',
        icon: Icons.landscape,
        color: Colors.green,
      ),
      CustomMarker(
        id: '3',
        position: const LatLng(30.0276, 31.2105), // المتحف المصري
        title: 'المتحف المصري',
        description: 'يحتوي على أكبر مجموعة من الآثار المصرية',
        icon: Icons.museum,
        color: Colors.purple,
      ),
      CustomMarker(
        id: '4',
        position: const LatLng(30.0596, 31.2230), // مدينة نصر
        title: 'مدينة نصر',
        description: 'منطقة سكنية وتجارية',
        icon: Icons.location_city,
        color: Colors.orange,
      ),
    ];

    setState(() => _markers = markers);
    _mapService.addMarkers(markers);
  }

  void _showMarkerDetails(CustomMarker marker) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                marker.title ?? 'بدون عنوان',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(marker.description ?? 'بدون وصف'),
              const SizedBox(height: 16),
              Text(
                'الإحداثيات: ${_mapService.formatCoordinates(marker.position)}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _mapService.moveToLocation(marker.position);
                  Navigator.pop(context);
                },
                child: const Text('الانتقال إلى الموقع'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _searchMarkers(String query) {
    if (query.isEmpty) {
      setState(() {
        _showSearchResults = false;
        _searchResults = [];
      });
      return;
    }

    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _searchResults =
          _markers.where((marker) {
            final title = marker.title?.toLowerCase() ?? '';
            final description = marker.description?.toLowerCase() ?? '';
            return title.contains(lowerCaseQuery) ||
                description.contains(lowerCaseQuery);
          }).toList();

      _showSearchResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  CustomMapWidget(
                    settings: MapSettings(
                      initialCenter: _initialCenter,
                      initialZoom: 15.0,
                      showMyLocation: true,
                    ),
                    initialMarkers: _markers,
                    onMarkerTap: _showMarkerDetails,
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => _mapService.moveToCurrentLocation(),
                      child: const Icon(Icons.my_location),
                    ),
                  ),

                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'ابحث في العلامات...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon:
                              _searchController.text.isNotEmpty
                                  ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() {
                                        _showSearchResults = false;
                                        _searchResults = [];
                                      });
                                    },
                                  )
                                  : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: _searchMarkers,
                      ),
                    ),
                  ),

                  if (_showSearchResults)
                    Positioned(
                      top: 100,
                      left: 16,
                      right: 16,
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 200),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final marker = _searchResults[index];
                            return ListTile(
                              leading: Icon(marker.icon, color: marker.color),
                              title: Text(marker.title ?? 'علامة'),
                              subtitle: Text(marker.description ?? 'بدون وصف'),
                              onTap: () {
                                _mapService.moveToLocation(marker.position);
                                setState(() => _showSearchResults = false);
                                _searchController.clear();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
    );
  }
}
