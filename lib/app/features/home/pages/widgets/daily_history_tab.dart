import 'package:flutter/material.dart';

import '../../model/daily_history.dart';

class DailyHistoryTab extends StatefulWidget {
  DailyHistoryTab({
    super.key,
    required this.list,
  });

  List<DailyHistory> list;

  @override
  State<DailyHistoryTab> createState() => _DailyHistoryTabState();
}

class _DailyHistoryTabState extends State<DailyHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: widget.list.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          DailyHistory history = widget.list[index];
          return ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.black.withOpacity(0.2), child: Text(history.count.toString())),
            title: Text('Date: ${history.date.day}-${history.date.month}-${history.date.year}'),
            subtitle: Text('Time: ${history.time.hour}:${history.time.minute}'),
            trailing: IconButton(
                onPressed: () {
                  widget.list.remove(index);
                  setState(() {});
                },
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
