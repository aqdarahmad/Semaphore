//We have a buffer (array) shared between the Producer and the Consumer.

//The Producer adds items to the buffer.

//The Consumer reads items from the buffer.

//We need to use a semaphore in order to:

//Prevent both Producer and Consumer from accessing the buffer at the same time (critical section protection).

//Prevent the Producer from adding more items than the buffer’s capacity.

//Prevent the Consumer from reading when the buffer is empty.


module tst;
parameter  N = 4;
int buffer[$];

semaphore mutex = new(1);
semaphore empty = new(N);
semaphore full = new(0);

initial begin
    fork 
 producer();
 consumer();
    join_any
    #100 $finish;
    end

  task producer;
   int item;
   forever begin 
    item = $urandom_range(1,100);
    empty.get(1);
    mutex.get(1);
    buffer.push_back(item);
    $display("[Producer] Produced item %0d at time %0t", item, $time);
     mutex.put(1);
     full.put(1);
     #10;
     end
  endtask  


  task consumer;
   int item;
   forever begin 
    item = $urandom_range(1,100);
    full.get(1);
    mutex.get(1);
    item = buffer.pop_front();
     $display("[Consumer] Consumed item %0d at time %0t", item, $time);

     mutex.put(1);
     empty.put(1);
     #15;
     end
  endtask  




endmodule