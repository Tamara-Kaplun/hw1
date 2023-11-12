# Практическая работа по Verilog №2 
## Verilog always block
В этом подпункте реализованы примеры со страницы https://www.chipverify.com/verilog/verilog-always-block.
### Пример 1
Блок always обладает следующей структурой: 
```verilog
  always @(<sensitivity_list>) <statements>
```
Этот блок выполняется при изменении сигналов, описанных в <sensitivity_list>. 
В примере демонстрируется использование блока always без sensitivity list. 
Если при этом не указать иным способом время задержки, симуляция зависнет. Ниже приведен код и скриншоты симуляции, демонстрирующие это. 
```verilog
  module testbench; 
  reg cls;
    initial begin
      cls = 1;
    end
    always cls = ~cls;
  endmodule
```
![Изображение 1](https://github.com/Tamara-Kaplun/hw_fpga/blob/main/hw2/images/1.png)
Чтобы избежать этого, можно прямо указать время задержки:  
```verilog
  //`timescale 1ns / 1ns 
  module testbench; 
  reg cls;
    initial begin
      cls = 1;
    end
    always #10 cls = ~cls;
  endmodule
```
В этом случае переменная cls будет менять свое значение каждые 10 ps.
![Изображение 2](https://github.com/Tamara-Kaplun/hw_fpga/blob/main/hw2/images/2.png)
### Пример 2 (sequential element design example )
