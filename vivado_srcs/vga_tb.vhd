----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2018 09:49:27 PM
-- Design Name: 
-- Module Name: vga_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_tb is
--  Port ( );
end vga_tb;

architecture Behavioral of vga_tb is
    constant HALF_PERIOD : time := 5 ns; -- 100MHz = 10ns 
    signal clk : std_logic := '0';
    signal m_axi_aresetn: std_logic := '0';
    signal m_axi_arready: std_logic := '1';
    signal m_axi_rdata  : std_logic_vector(31 downto 0) := (others => '0');
    signal m_axi_rlast  : std_logic := '0';
    signal m_axi_rvalid : std_logic := '0';
begin
    my_vga : entity work.vga        
        port map(          
            M_AXI_ACLK => clk,
            M_AXI_ARESETN   => m_axi_aresetn,
            M_AXI_ARREADY   => m_axi_arready,
            M_AXI_RDATA     => m_axi_rdata,
            M_AXI_RLAST     => m_axi_rlast,
            M_AXI_RVALID    => m_axi_rvalid
        );             
    clk <= '0' after HALF_PERIOD when clk = '1' else '1' after HALF_PERIOD; 

end Behavioral;
