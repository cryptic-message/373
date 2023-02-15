% ELEC373 Assignment 1
figure('Name','Average Queueing Delay');
N = 10 * 1000000;
service_rate = 0.75;
arrival_rate = [0.2, 0.4, 0.5, 0.6, 0.65, 0.7, 0.72, 0.74, 0.745];
queue_length = [0,0,0,0,0,0,0,0,0];
average_queue = [0,0,0,0,0,0,0,0,0];
average_wait = [0,0,0,0,0,0,0,0,0];

% Generate average queue lengths and calculate average queueing delay using
% Little's Law
for i = 1:9
   sum = 0; % keeps a total, used for the average at the end of for loop
   for j = 1:N
      num1 = rand(1); % event of a departure
      num2 = rand(1); % event of an arrival
      
      % If there is a packet in the queue and there is a departure
      if(num1 < service_rate & queue_length(i) > 0)
          % subtract 1 from the current queue length
          queue_length(i) = queue_length(i) - 1;
      end
      % If there is an arrival
      if(num2 < arrival_rate(i))
          % Add 1 to the current queue length
          queue_length(i) = queue_length(i) + 1;
      end
      % add current queue length to the total sum
      sum = sum + queue_length(i);
   end
   % Calculate average queue length based on the sum
   average_queue(i) = sum/N;
   % Using Little's Law, calculate the average queueing delay
   average_wait(i) = average_queue(i)/arrival_rate(i); % Little's Law
end

plot(arrival_rate, average_wait);

hold on;
title("Plot of Average Queueing Delay & Arrival Rate");
xlabel("Arrival Rate (%/timeslot)");
ylabel("Average Queueing Delay (timeslots)");
hold off;