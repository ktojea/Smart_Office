import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/interactive_map/toggle.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<String> listOfDevices = [
    'Электрочайник 1',
    'Электрочайник 2',
    'Электрочайник 3',
    'Умная лампа 1',
    'Умная лампа 2',
    'Умная лампа 3',
    'Умная лампа 4',
    'Умная лампа 5',
    'Умная лампа 6',
    'Кондиционер 1',
    'Кондиционер 2',
    'Кондиционер 3',
    'Кондиционер 4',
    'Кондиционер 5',
    'Кондиционер 6',
    'Кондиционер 7',
    'Кондиционер 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
      child: Stack(
        children: [
          InteractiveViewer(
            maxScale: 2,
            child: SvgPicture.asset(
              bgForMap,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                margin: const EdgeInsets.all(14),
                padding: const EdgeInsets.all(20),
                decoration: whiteBoxDecoration,
                height: 180,
                child: ListView.builder(
                  itemCount: listOfDevices.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        Text(listOfDevices[index]),
                        const SizedBox(height: 5),
                        const CustomToggleButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
