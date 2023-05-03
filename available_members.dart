///An algorithm that allows you to get a list of all the first elements of subarrays 
///in which the difference of all `k` members does not exceed the specified `maxDiff` value.
///
///Sliding window method applied.
///
///The sequence must be strictly ascending, the array must be sorted.

void main() {
final List<int> intList = [1,2,3,4,5,6,7,9,12,16,17,18,19,21,50,51,52,53,54,55,];
 
  final resultList = availableMembers(intList, 5, 1);
  print('result: $resultList');
 
}


  List<int> availableMembers(
    List<int> list,
    int k,
    int maxDiff,
  ) {
    
    final result = <int>[];//Result list
  
    if(k<=0||maxDiff<0){
      return result;
    }
    var j = 0; //Left pointer
    
    
    for(var i = 0; i<list.length;i++){
   
      final sublist = list.sublist(j,i+1);    
      
      if(sublist.length<k){
        continue;
      }
      
      if (sublist.last-sublist.first<k*maxDiff) {
        result.add(list[j]);
    }
    

      j++;
      
    }
   
   
    return result;
  }
