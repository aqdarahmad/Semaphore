                   
module semaphore_example;
semaphore sema = new(1);

initial begin
fork
process1();
process2();
join
end

task process1;
sema.get(1);
$display("p1 run");
sema.put(1);
endtask

task process2;
sema.get(1);
$display("p2 run");
sema.put(1);
endtask
endmodule

