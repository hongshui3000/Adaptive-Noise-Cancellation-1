-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lms\lms_filter_ipcore_dut.vhd
-- Created: 2018-04-02 19:23:34
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: lms_filter_ipcore_dut
-- Source Path: lms_filter_ipcore/lms_filter_ipcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY lms_filter_ipcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        x_k                               :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        d_k                               :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        ce_out                            :   OUT   std_logic;  -- ufix1
        e_k                               :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        o_k                               :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En23
        );
END lms_filter_ipcore_dut;


ARCHITECTURE rtl OF lms_filter_ipcore_dut IS

  -- Component Declarations
  COMPONENT LMS
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          x_k                             :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          d_k                             :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          ce_out                          :   OUT   std_logic;  -- ufix1
          e_k                             :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          o_k                             :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En23
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LMS
    USE ENTITY work.LMS(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL e_k_sig                          : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL o_k_sig                          : std_logic_vector(23 DOWNTO 0);  -- ufix24

BEGIN
  u_LMS : LMS
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              x_k => x_k,  -- sfix24_En23
              d_k => d_k,  -- sfix24_En23
              ce_out => ce_out_sig,  -- ufix1
              e_k => e_k_sig,  -- sfix24_En23
              o_k => o_k_sig  -- sfix24_En23
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  e_k <= e_k_sig;

  o_k <= o_k_sig;

END rtl;

