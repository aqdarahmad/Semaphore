//We have a buffer (array) shared between the Producer and the Consumer.

//The Producer adds items to the buffer.

//The Consumer reads items from the buffer.

//We need to use a semaphore in order to:

//Prevent both Producer and Consumer from accessing the buffer at the same time (critical section protection).

//Prevent the Producer from adding more items than the buffer’s capacity.

//Prevent the Consumer from reading when the buffer is empty.