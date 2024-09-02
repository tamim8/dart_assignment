import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constance/app_strings.dart';
import '../../../../widget/WaterBottleWidget.dart';
import '../../model/daily_history.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  MobileLayoutState createState() => MobileLayoutState();
}

class MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  double _fillPercentage = 0.0;
  int _glassCount = 0;
  int _goal = 5;
  late TabController _tabController;
  final TextEditingController _setGoalController = TextEditingController();
  final List<DailyHistory> _dailyHistoryList = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection != ScrollDirection.idle) {
        FocusScope.of(context).unfocus(); // Hide keyboard when scrolling
      }
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _setGoalController.dispose();
    _tabController.dispose();
    _fillPercentage = 0.0;
    _glassCount = 0;
    _goal = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // Hide keyboard when tapping outside
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            AppString.appName,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          controller:_scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Set your daily goals',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: _setGoalController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[1-8]')), // Allow only numbers 1-8
                              LengthLimitingTextInputFormatter(1), // Limit input to 1 character
                            ],
                            decoration: InputDecoration(
                              hintText: _goal.toString(),
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _setMyGoal(),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text('SET'),
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _showResetDialog(context),
                      label: const Text('RESET'),
                      icon: const Icon(Icons.lock_reset),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildWaterBottle(),
                const Text(
                  'History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // TabBar and TabBarView wrapped in a Column
                _buildHistoryTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWaterBottle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WaterBottleWidget(
          fillPercentage: _fillPercentage,
          goal: _goal,
        ),
        Column(
          children: [
            Text(
              _glassCount.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Glass',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 15),
            _buildIconButton(onPress: () => _drinkWater()),
          ],
        ),
      ],
    );
  }

  Widget _buildHistoryTab() {
    return SizedBox(
      height: 400, // or any fixed height that works for your layout
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: const [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _dailyHistoryTab(),
                // DailyHistoryTab(list: _dailyHistoryList),
                const WeeklyHistoryTab(),
                const MonthlyHistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({required onPress}) {
    return IconButton(
      onPressed: onPress,
      icon: const Icon(Icons.add, size: 40),
      iconSize: 40,
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(18),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _setMyGoal() {
    final int updateGoal = int.parse(_setGoalController.text);
    if (updateGoal != '' && _dailyHistoryList.isEmpty) {
      _goal = updateGoal;
      setState(() {});
      _showSnackBar(context, 'New goal added');
    } else if (updateGoal > _goal && _dailyHistoryList.isNotEmpty) {
      _goal = updateGoal;
      final percentage = (100 / (_goal * 4)) * _glassCount;
      _fillPercentage = percentage;
      setState(() {});
      _showSnackBar(context, 'New goal added');
    } else {
      _showSnackBar(context, 'You cannot set lower than the previous target,\nplease reset and try again');
    }
  }

  void _drinkWater() {
    final percentage = 100 / (_goal * 4);
    if (_glassCount != (_goal * 4)) {
      _glassCount++;
      _fillPercentage += percentage;
      _dailyHistoryList.add(DailyHistory(_glassCount, date: DateTime.now(), time: TimeOfDay.now()));
    }

    setState(() {});
    _showSnackBar(context, 'You drank a glass of water');
  }

  void _removeWater({index}) {
    final percentage = 100 / (_goal * 4);
    _dailyHistoryList.removeAt(index);
    _glassCount--;
    _fillPercentage -= percentage;
    setState(() {});
    _showSnackBar(context, 'Delete Complete');
  }

  void _resetMyHistory() {
    _dailyHistoryList.clear();
    _glassCount = 0;
    _goal = 5;
    _fillPercentage = 0;
    _setGoalController.clear();
    setState(() {});
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Confirmation'),
          content: const Text('Are you sure you want to reset this history?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Dismiss the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform delete operation here
                _resetMyHistory();
                Navigator.of(context).pop(); // Close the dialog
                _showSnackBar(context, 'Reset Complete');
              },
              child: const Text('Reset', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2), // Duration of the "toast"
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _dailyHistoryTab() {
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: _dailyHistoryList.length,
        itemBuilder: (BuildContext context, int index) {
          int reversedIndex = _dailyHistoryList.length - (1 + index);
          DailyHistory history = _dailyHistoryList[reversedIndex];
          return ListTile(
            leading:
            CircleAvatar(backgroundColor: Colors.black.withOpacity(0.2), child: Text(history.count.toString())),
            title: Text('Date: ${history.date.day}-${history.date.month}-${history.date.year}'),
            subtitle: Text('Time: ${history.time.hour}:${history.time.minute}'),
            trailing: IconButton(
                onPressed: () => _removeWater(index: reversedIndex),
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class WeeklyHistoryTab extends StatelessWidget {
  const WeeklyHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reports Content'),
    );
  }
}

class MonthlyHistoryTab extends StatelessWidget {
  const MonthlyHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Content'),
    );
  }
}
