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
В этом примере создается модуль ttf, получающий на вход d, clk и rstn и отдающий на выход q. Этот модуль содержит блок always, срабатывающий по отрицательному фронту входного значения rstn и по положительному фронту значения clk. 
```verilog
module ttf (input d,
		  clk,
      		  rstn, 
	    output reg q);
	always @(posedge clk or negedge rstn) begin
		if(!rstn)
			q<=0;
		else
			if (d)
				q<= ~q;
			else
				q <= q;
	end
endmodule
```
В таблице ниже приведены все возможные варианты работы этого модуля. 
<table>
    <thead>
        <tr>
            <th> sensitivity list </th>
            <th> rst </th>
            <th> d </th>
	    <th> q </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=3 align="center">положительный фронт clk</td>
            <td align="center">  0 </td>
	    <td align="center"> ∀ </td>
            <td align="center">  0 </td>
        </tr>
        <tr>
            <td rowspan=2 align="center"> 1</td>
	    <td align="center">  1 </td>
	    <td align="center"> -q  </td>
        </tr>
        <tr>
	    <td align="center">  0 </td>
	    <td align="center">  q </td>
        </tr>
        <tr>
            <td align="center">отрицательный фронт rstn</td>
	    <td align="center">  0 </td>
	    <td align="center"> ∀  </td>
            <td align="center"> 0</td>
        </tr>
    </tbody>
</table>
Все эти случаи можно увидеть на рис. ниже. На нем представленны результаты симуляции и синтеза. Исходные файлы лежат в этой папке под названиями  [ttf.v]

<a href="[http://site.ru](https://github.com/Tamara-Kaplun/hw_fpga/blob/main/hw2/ttf.v)"> указатель ссылки </a>  

и 

[ttf_testbench.v](https://github.com/Tamara-Kaplun/hw_fpga/blob/main/hw2/ttf_testbench.v). 

![Изображение 3](https://github.com/Tamara-Kaplun/hw_fpga/blob/main/hw2/images/3.png)

### Пример 3 (combinational element design)
