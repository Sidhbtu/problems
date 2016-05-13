#Using the Ruby language, have the function CountingMinutesI(str) take the str 
#parameter being passed which will be two times (each properly formatted with a 
#colon and am or pm) separated by a hyphen and return the total number of minutes
#between the two times. The time will be in a 12 hour clock format. For example:
#if str is 9:00am-10:00am then the output should be 60. If str is 1:00pm-11:00am
#the output should be 1320. 


# Solution 1: 
# Only work partically
def CountingMinutesI(str)
  s = str.scan(/\w+/).to_a
  
  arr = str.scan(/\d+|\D+/)
  result = (arr[0].to_i - arr[4].to_i).abs * 60 - arr[2].to_i + arr[6].to_i
   
  if arr[0] == arr[4] && arr[3].delete("-") != arr[7] 
    result += 720 
  elsif  arr[0] == arr[4] && arr[3].delete("-") == arr[7] 
    result += 1440
  elsif arr[0] != arr[4] && arr[3].delete("-") != arr[7]
    result += 720 
  elsif arr[0] != arr[4] && arr[3].delete("-") == arr[7] 
    result
  end
      
end

# Solution 2: search result
# not quite understand the algorithm here:
require 'time'

def CountingMinutesI(str)
  puts str.split("-")[0]
 
  puts str.split("-")[1]
  puts start = Time.parse(str.split("-")[0])
  puts stop =  Time.parse(str.split("-")[1])
  
  # does this reset the time by 24 hours? why???????
  if stop < start
    stop += 86400 # This is 24 hours.
  end
  elapsed_time = 0

  until start == stop
  start += 60
  elapsed_time += 60
  end

 puts elapsed_time/60
end



# keep this function call here    
puts CountingMinutesI("12:30am-12:00pm") == 690
puts CountingMinutesI("1:23am-1:08am") == 1425
puts CountingMinutesI("10:00am-11:00pm") == 780
puts CountingMinutesI("10:00am-12:30pm") == 150 # failed test

#Input = "12:30pm-12:00am" Output = 690
#Input = "1:23am-1:08am"  Output = 1425