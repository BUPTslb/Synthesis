entity test is
	port(
		in1:  in bit_vector(7 downto 0);
		in2:  in bit_vector(7 downto 0);
		out1: in bit_vector(7 downto 0);
		out2: in bit_vector(7 downto 0);
		clk:  in bit
	);	
end test;

architecture Behavioral of test is
signal A: bit_vector(7 downto 0);
signal B: bit_vector(7 downto 0);
signal C: bit_vector(7 downto 0);
signal D: bit_vector(7 downto 0);
begin

process(clk)
begin
	A <= in1 and in2;
	B <= in1 or in2;
	C <= (not A) xor B ;
	D <= C sll 1;
	out1 <=A nor C ;
	out2 <=B nor D;	
end process;

end Behavioral;