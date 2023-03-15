List<DateTime> getDateTimeInHourRange(DateTime selectedDate, List<int> hourRange) {
  assert(hours.length==2,'There is must be only 2 members: period start an period end');
  assert(hours.first<hours.last, 'Period end cannot be less than period start');

  final firstTimeMinutes = hourRange.first<selectedDate.hour
  ?selectedDate.minute
  :0;
  
  final firstTime = DateTime(
        selectedDate.year, 
        selectedDate.month, 
        selectedDate.day, 
        math.max(hourRange.first, selectedDate.hour),
        firstTimeMinutes,
    );
  
  
  final lastTime = DateTime(
        selectedDate.year, 
        selectedDate.month, 
        selectedDate.day, 
        hourRange.last,
        );

  
  final startTime = firstTime.add(
          Duration(minutes: 30 - firstTime.minute % 30,),
      );
      
  final List<DateTime> output = [];
  
    for (DateTime time = startTime; time.isBefore(lastTime) || time.isAtSameMomentAs(lastTime);
    time = time.add(const Duration(minutes: 30))) {
      output.add(time);
    }
  
    return output;
  }
