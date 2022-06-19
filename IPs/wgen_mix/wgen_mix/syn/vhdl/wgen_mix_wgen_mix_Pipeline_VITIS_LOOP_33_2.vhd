-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity wgen_mix_wgen_mix_Pipeline_VITIS_LOOP_33_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_TVALID : IN STD_LOGIC;
    word_TVALID : IN STD_LOGIC;
    dst_TREADY : IN STD_LOGIC;
    cols : IN STD_LOGIC_VECTOR (30 downto 0);
    sub13 : IN STD_LOGIC_VECTOR (30 downto 0);
    cmp12 : IN STD_LOGIC_VECTOR (0 downto 0);
    dst_TDATA : OUT STD_LOGIC_VECTOR (23 downto 0);
    dst_TVALID : OUT STD_LOGIC;
    dst_TKEEP : OUT STD_LOGIC_VECTOR (2 downto 0);
    dst_TSTRB : OUT STD_LOGIC_VECTOR (2 downto 0);
    dst_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    src_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    src_TREADY : OUT STD_LOGIC;
    src_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    cmp5 : IN STD_LOGIC_VECTOR (0 downto 0);
    word_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    word_TREADY : OUT STD_LOGIC;
    word_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    word_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    word_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    word_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    word_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    word_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    wrecv : OUT STD_LOGIC_VECTOR (31 downto 0);
    wrecv_ap_vld : OUT STD_LOGIC;
    word_row_usage_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    word_row_usage_out_ap_vld : OUT STD_LOGIC;
    wrecv_n_local_i : IN STD_LOGIC_VECTOR (31 downto 0);
    wrecv_n_local_o : OUT STD_LOGIC_VECTOR (31 downto 0);
    wrecv_n_local_o_ap_vld : OUT STD_LOGIC );
end;


architecture behav of wgen_mix_wgen_mix_Pipeline_VITIS_LOOP_33_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv3_7 : STD_LOGIC_VECTOR (2 downto 0) := "111";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv31_CF : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000011001111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln33_fu_241_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln39_fu_262_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op36_read_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal dst_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal src_TDATA_blk_n : STD_LOGIC;
    signal word_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal pkg_last_V_fu_307_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal pkg_last_V_reg_374 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_pkg_data_V_3_reg_218 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_pkg_data_V_3_reg_218 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln43_fu_284_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_fu_106 : STD_LOGIC_VECTOR (30 downto 0);
    signal j_5_fu_246_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal word_row_usage_fu_110 : STD_LOGIC_VECTOR (31 downto 0);
    signal word_row_usage_1_fu_274_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln39_fu_256_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln45_fu_302_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_148 : BOOLEAN;
    signal ap_condition_288 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component wgen_mix_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component wgen_mix_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_148)) then
                if (((ap_const_lv1_0 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218 <= src_TDATA;
                elsif (((ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218 <= word_TDATA;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218 <= ap_phi_reg_pp0_iter1_pkg_data_V_3_reg_218;
                end if;
            end if; 
        end if;
    end process;

    j_fu_106_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_106 <= ap_const_lv31_0;
                elsif (((icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    j_fu_106 <= j_5_fu_246_p2;
                end if;
            end if; 
        end if;
    end process;

    word_row_usage_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    word_row_usage_fu_110 <= ap_const_lv32_0;
                elsif ((ap_const_boolean_1 = ap_condition_288)) then 
                    word_row_usage_fu_110 <= word_row_usage_1_fu_274_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_pkg_data_V_3_reg_218 <= ap_phi_reg_pp0_iter0_pkg_data_V_3_reg_218;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                pkg_last_V_reg_374 <= pkg_last_V_fu_307_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln43_fu_284_p2 <= std_logic_vector(unsigned(wrecv_n_local_i) + unsigned(ap_const_lv32_1));
    and_ln39_fu_262_p2 <= (icmp_ln39_fu_256_p2 and cmp5);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, src_TVALID, icmp_ln33_fu_241_p2, word_TVALID, ap_predicate_op36_read_state2, dst_TREADY)
    begin
                ap_block_pp0_stage0_01001 <= (((dst_TREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (word_TVALID = ap_const_logic_0)) or ((icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, src_TVALID, icmp_ln33_fu_241_p2, word_TVALID, ap_predicate_op36_read_state2, dst_TREADY)
    begin
                ap_block_pp0_stage0_11001 <= (((dst_TREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (word_TVALID = ap_const_logic_0)) or ((icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, src_TVALID, icmp_ln33_fu_241_p2, word_TVALID, ap_predicate_op36_read_state2, dst_TREADY)
    begin
                ap_block_pp0_stage0_subdone <= (((dst_TREADY = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (word_TVALID = ap_const_logic_0)) or ((icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(src_TVALID, icmp_ln33_fu_241_p2, word_TVALID, ap_predicate_op36_read_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (word_TVALID = ap_const_logic_0)) or ((icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(dst_TREADY)
    begin
                ap_block_state3_pp0_stage0_iter2 <= (dst_TREADY = ap_const_logic_0);
    end process;


    ap_condition_148_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
                ap_condition_148 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_288_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, and_ln39_fu_262_p2)
    begin
                ap_condition_288 <= ((ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln33_fu_241_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;
    ap_phi_reg_pp0_iter0_pkg_data_V_3_reg_218 <= "XXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op36_read_state2_assign_proc : process(icmp_ln33_fu_241_p2, and_ln39_fu_262_p2)
    begin
                ap_predicate_op36_read_state2 <= ((ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    dst_TDATA <= ap_phi_reg_pp0_iter2_pkg_data_V_3_reg_218;

    dst_TDATA_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, dst_TREADY, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            dst_TDATA_blk_n <= dst_TREADY;
        else 
            dst_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_TDEST <= ap_const_lv1_0;
    dst_TID <= ap_const_lv1_0;
    dst_TKEEP <= ap_const_lv3_7;
    dst_TLAST <= pkg_last_V_reg_374;
    dst_TSTRB <= ap_const_lv3_7;
    dst_TUSER <= ap_const_lv1_0;

    dst_TVALID_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            dst_TVALID <= ap_const_logic_1;
        else 
            dst_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln33_fu_241_p2 <= "1" when (j_fu_106 = cols) else "0";
    icmp_ln39_fu_256_p2 <= "1" when (unsigned(j_fu_106) < unsigned(ap_const_lv31_CF)) else "0";
    icmp_ln45_fu_302_p2 <= "1" when (j_fu_106 = sub13) else "0";
    j_5_fu_246_p2 <= std_logic_vector(unsigned(j_fu_106) + unsigned(ap_const_lv31_1));
    pkg_last_V_fu_307_p2 <= (icmp_ln45_fu_302_p2 and cmp12);

    src_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, src_TVALID, icmp_ln33_fu_241_p2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_TDATA_blk_n <= src_TVALID;
        else 
            src_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_TREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_TREADY <= ap_const_logic_1;
        else 
            src_TREADY <= ap_const_logic_0;
        end if; 
    end process;


    word_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, word_TVALID, ap_predicate_op36_read_state2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op36_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            word_TDATA_blk_n <= word_TVALID;
        else 
            word_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    word_TREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op36_read_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op36_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            word_TREADY <= ap_const_logic_1;
        else 
            word_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    word_row_usage_1_fu_274_p2 <= std_logic_vector(unsigned(word_row_usage_fu_110) + unsigned(ap_const_lv32_1));
    word_row_usage_out <= word_row_usage_fu_110;

    word_row_usage_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln33_fu_241_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln33_fu_241_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            word_row_usage_out_ap_vld <= ap_const_logic_1;
        else 
            word_row_usage_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    wrecv <= std_logic_vector(unsigned(wrecv_n_local_i) + unsigned(ap_const_lv32_1));

    wrecv_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, and_ln39_fu_262_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            wrecv_ap_vld <= ap_const_logic_1;
        else 
            wrecv_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    wrecv_n_local_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, and_ln39_fu_262_p2, wrecv_n_local_i, ap_block_pp0_stage0, add_ln43_fu_284_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            wrecv_n_local_o <= add_ln43_fu_284_p2;
        else 
            wrecv_n_local_o <= wrecv_n_local_i;
        end if; 
    end process;


    wrecv_n_local_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln33_fu_241_p2, and_ln39_fu_262_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_lv1_1 = and_ln39_fu_262_p2) and (icmp_ln33_fu_241_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            wrecv_n_local_o_ap_vld <= ap_const_logic_1;
        else 
            wrecv_n_local_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;
