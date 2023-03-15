///This method takes a date (based on which to return the interval), an array of two elements (the beginning and end of the interval), and a period in minutes (30 by default).

///At the output, we will get a list of DateTime instances with a given period, obtained based on the beginning and end of the interval in hours.

List<DateTime> getDateTimeInHourRange(DateTime date, List<int> hourRange, [int minutesPeriod = 30]) {
  assert(hourRange.length==2,'There is must be only 2 members: period start an period end');
  assert(hourRange.first<hourRange.last, 'Period end cannot be less than period start');

  final firstTimeMinutes = hourRange.first<date.hour
  ?date.minute
  :0;
  
  final firstTime = DateTime(
        date.year, 
        date.month, 
        date.day, 
        math.max(hourRange.first, date.hour),
        firstTimeMinutes,
    );
  
  
  final lastTime = DateTime(
        date.year, 
        date.month, 
        date.day, 
        hourRange.last,
        );

  
  final startTime = firstTime.add(
          Duration(minutes: minutesPeriod - firstTime.minute % minutesPeriod,),
      );
      
  final List<DateTime> output = [];
  
    for (DateTime time = startTime; time.isBefore(lastTime) || time.isAtSameMomentAs(lastTime);
    time = time.add(Duration(minutes: minutesPeriod))) {
      output.add(time);
    }
  
  return output;
}
