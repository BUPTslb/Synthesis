entity  testvhdl is
	port(
		in1: in bit_vector(7 downto 0);
		in2: in bit_vector(7 downto 0);
		out1: in bit_vector(7 downto 0);
		out2: in bit_vector(7 downto 0);
		clk: in bit
				
	);	
end testvhdl;

architecture Behavioral of testvhdl is
--可以在此处定义信号
signal A,B,C,D: bit_vector(7 downto 0);
begin
--并行处理语句
--AND OR INV XOR 
process(clk)
begin
	A <= in1 and in2;
	B <= in1 or in2;
	C <= (not A) xor B ;
	D <= C sll 1; --逻辑左移一位
	out1 <=A nor C ;
	out2 <=B nor D;	
end process

end Behavioral;
