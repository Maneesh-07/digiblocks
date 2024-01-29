import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/p.dart';
import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';
import '../controller.dart';

class BoolingCard extends StatefulWidget {
  @override
  State<BoolingCard> createState() => _BoolingCardState();
}

class _BoolingCardState extends State<BoolingCard>
    with TickerProviderStateMixin {
  int? val = -1;
  bool _value = false;
  late String dateValue =
      DateFormat('EEEE, d MMM').format(P.dashboard.travelDate.value);

  String selectedValue = 'Select Option'; // Default selected value
  List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            height: 335,
            child: Stack(children: <Widget>[
              Positioned(
                  top: 0,
                  left: 2,
                  right: 2,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: cards,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: TabBar(
                                labelPadding:
                                    const EdgeInsets.only(left: 0, right: 35),
                                controller: _tabController,
                                labelColor: primary,
                                unselectedLabelColor: Colors.grey,
                                isScrollable: true,
                                indicatorColor: primary,
                                tabs: const [
                                  Tab(text: "Oneway"),
                                  Tab(text: "Round Trip"),
                                  Tab(text: "Multi-city"),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 52,
                  left: 2,
                  right: 0,
                  child: Container(
                    height: 285,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: cards,
                      border: Border.all(
                        color: Surface,
                        width: 4,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 1, right: 20, bottom: 1),
                          child: GestureDetector(
                            onTap: () {
                              P.dashboard
                                  .changeWidgetShowed(widget: Show.SELECT_CITY);
                            },
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor.withOpacity(0.3)),
                                    ),
                                    Space.Y(10),
                                    P.dashboard.flyingFrom != null
                                        ? Text(
                                            P.dashboard.flyingFrom!.iata_code!,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: textColor),
                                          )
                                        : Text(
                                            'Select City',
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: textColor),
                                          ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset('assets/svg/book.svg',
                                    color: textColor.withOpacity(0.2),
                                    semanticsLabel: 'A red up arrow'),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'TO',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor.withOpacity(0.3)),
                                    ),
                                    Space.Y(10),
                                    P.dashboard.flyingTo != null
                                        ? Text(
                                            P.dashboard.flyingTo!.iata_code!,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: textColor),
                                          )
                                        : Text(
                                            'Select City',
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: textColor),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRAVEL DATE',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor.withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        dateValue,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    _showDatePicker(context);
                                  }),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'RETURN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: textColor.withOpacity(0.3),
                                    ),
                                  ),
                                  Space.Y(5),
                                  Text(
                                    'Select Date',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: textColor.withOpacity(0.3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRAVELLERS',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor.withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        P.dashboard.adult.value.toString() +
                                            ' Adult',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    _showDropdownMenu(context);
                                  },
                                ),
                                Spacer(),
                                VerticalDivider(
                                  color: textColor.withOpacity(0.2),
                                  thickness: 3,
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    P.dashboard.changeWidgetShowed(
                                        widget: Show.FLIGHT_CLASS);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'CLASS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor.withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        P.dashboard.flightClass.value,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        ListTile(
                          title: Text(
                            "Show direct flight only",
                            style: TextStyle(color: textColor),
                          ),
                          leading: Radio(
                            value: 1,
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value as int?;
                              });
                            },
                            activeColor: textColor,
                          ),
                        ),
                      ],
                    ),
                  )),
            ]))
      ],
    );
  }

  void _showDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1975),
      lastDate: DateTime(2035),
    );
    if (selectedDate != null) {
      setState(() {
        final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        dateValue = formattedDate;
      });
    }
  }

  void _showDropdownMenu(BuildContext context) async {
    String? result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 460, 0, 0),
      items: dropdownOptions.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() {
        selectedValue = result;
      });

      // Do something with the selected value, e.g., update the state
      P.dashboard.changeWidgetShowed(widget: Show.TRAVELLER);
    }
  }
}
