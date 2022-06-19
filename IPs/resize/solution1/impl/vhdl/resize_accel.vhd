-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity resize_accel is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_local_block : OUT STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    src_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    src_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    dst_TDATA : OUT STD_LOGIC_VECTOR (23 downto 0);
    dst_TKEEP : OUT STD_LOGIC_VECTOR (2 downto 0);
    dst_TSTRB : OUT STD_LOGIC_VECTOR (2 downto 0);
    dst_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    dst_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    src_TVALID : IN STD_LOGIC;
    src_TREADY : OUT STD_LOGIC;
    dst_TVALID : OUT STD_LOGIC;
    dst_TREADY : IN STD_LOGIC );
end;


architecture behav of resize_accel is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "resize_accel_resize_accel,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=7.655250,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=36,HLS_SYN_DSP=0,HLS_SYN_FF=6396,HLS_SYN_LUT=5992,HLS_VERSION=2021_2}";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_local_deadlock : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_rst_n_inv : STD_LOGIC;
    signal src_rows : STD_LOGIC_VECTOR (31 downto 0);
    signal src_cols : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_rows : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_cols : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_start : STD_LOGIC;
    signal ap_ready : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal Block_split1_proc_U0_ap_start : STD_LOGIC;
    signal Block_split1_proc_U0_ap_done : STD_LOGIC;
    signal Block_split1_proc_U0_ap_continue : STD_LOGIC;
    signal Block_split1_proc_U0_ap_idle : STD_LOGIC;
    signal Block_split1_proc_U0_ap_ready : STD_LOGIC;
    signal Block_split1_proc_U0_ap_return_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_split1_proc_U0_ap_return_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_split1_proc_U0_ap_return_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_split1_proc_U0_ap_return_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_channel_done_dst_mat_cols_c12_channel : STD_LOGIC;
    signal dst_mat_cols_c12_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_dst_mat_cols_c12_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_dst_mat_cols_c12_channel : STD_LOGIC;
    signal ap_channel_done_dst_mat_rows_c11_channel : STD_LOGIC;
    signal dst_mat_rows_c11_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_dst_mat_rows_c11_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_dst_mat_rows_c11_channel : STD_LOGIC;
    signal ap_channel_done_src_mat_cols_c10_channel : STD_LOGIC;
    signal src_mat_cols_c10_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_src_mat_cols_c10_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_src_mat_cols_c10_channel : STD_LOGIC;
    signal ap_channel_done_src_mat_rows_c9_channel : STD_LOGIC;
    signal src_mat_rows_c9_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_src_mat_rows_c9_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_src_mat_rows_c9_channel : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_ap_start : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_ap_done : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_ap_continue : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_ap_idle : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_ap_ready : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_src_TREADY : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din : STD_LOGIC_VECTOR (23 downto 0);
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write : STD_LOGIC;
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_ap_done : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_start_out : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_start_write : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din : STD_LOGIC_VECTOR (23 downto 0);
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write : STD_LOGIC;
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_ap_start : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_ap_done : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_ap_continue : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_ap_idle : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_ap_ready : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_img_rows_read : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_img_cols_read : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA : STD_LOGIC_VECTOR (23 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID : STD_LOGIC;
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TID : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST : STD_LOGIC_VECTOR (0 downto 0);
    signal src_mat_rows_c9_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal src_mat_rows_c9_channel_empty_n : STD_LOGIC;
    signal src_mat_cols_c10_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal src_mat_cols_c10_channel_empty_n : STD_LOGIC;
    signal dst_mat_rows_c11_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_mat_rows_c11_channel_empty_n : STD_LOGIC;
    signal dst_mat_cols_c12_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_mat_cols_c12_channel_empty_n : STD_LOGIC;
    signal src_mat_data_full_n : STD_LOGIC;
    signal src_mat_data_dout : STD_LOGIC_VECTOR (23 downto 0);
    signal src_mat_data_empty_n : STD_LOGIC;
    signal src_mat_rows_c_full_n : STD_LOGIC;
    signal src_mat_rows_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal src_mat_rows_c_empty_n : STD_LOGIC;
    signal src_mat_cols_c_full_n : STD_LOGIC;
    signal src_mat_cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal src_mat_cols_c_empty_n : STD_LOGIC;
    signal dst_mat_data_full_n : STD_LOGIC;
    signal dst_mat_data_dout : STD_LOGIC_VECTOR (23 downto 0);
    signal dst_mat_data_empty_n : STD_LOGIC;
    signal dst_mat_rows_c_full_n : STD_LOGIC;
    signal dst_mat_rows_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_mat_rows_c_empty_n : STD_LOGIC;
    signal dst_mat_cols_c_full_n : STD_LOGIC;
    signal dst_mat_cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_mat_cols_c_empty_n : STD_LOGIC;
    signal start_for_xfMat2axis_24_9_2160_3840_1_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n : STD_LOGIC;
    signal start_for_xfMat2axis_24_9_2160_3840_1_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component resize_accel_Block_split1_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_rows : IN STD_LOGIC_VECTOR (31 downto 0);
        src_cols : IN STD_LOGIC_VECTOR (31 downto 0);
        dst_rows : IN STD_LOGIC_VECTOR (31 downto 0);
        dst_cols : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_3 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component resize_accel_axis2xfMat_24_9_2160_3840_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
        src_TVALID : IN STD_LOGIC;
        src_TREADY : OUT STD_LOGIC;
        src_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
        src_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
        src_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        src_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        src_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        src_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        p_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        src_mat_420_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        src_mat_420_full_n : IN STD_LOGIC;
        src_mat_420_write : OUT STD_LOGIC;
        src_mat_rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        src_mat_rows_c_full_n : IN STD_LOGIC;
        src_mat_rows_c_write : OUT STD_LOGIC;
        src_mat_cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        src_mat_cols_c_full_n : IN STD_LOGIC;
        src_mat_cols_c_write : OUT STD_LOGIC );
    end component;


    component resize_accel_resize_1_9_2160_3840_2160_3840_1_9_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        p_src_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_rows_empty_n : IN STD_LOGIC;
        p_src_rows_read : OUT STD_LOGIC;
        p_src_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_cols_empty_n : IN STD_LOGIC;
        p_src_cols_read : OUT STD_LOGIC;
        src_mat_420_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        src_mat_420_empty_n : IN STD_LOGIC;
        src_mat_420_read : OUT STD_LOGIC;
        p_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dst_mat_421_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        dst_mat_421_full_n : IN STD_LOGIC;
        dst_mat_421_write : OUT STD_LOGIC;
        dst_mat_rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        dst_mat_rows_c_full_n : IN STD_LOGIC;
        dst_mat_rows_c_write : OUT STD_LOGIC;
        dst_mat_cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        dst_mat_cols_c_full_n : IN STD_LOGIC;
        dst_mat_cols_c_write : OUT STD_LOGIC );
    end component;


    component resize_accel_xfMat2axis_24_9_2160_3840_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        img_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        img_rows_empty_n : IN STD_LOGIC;
        img_rows_read : OUT STD_LOGIC;
        img_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        img_cols_empty_n : IN STD_LOGIC;
        img_cols_read : OUT STD_LOGIC;
        dst_mat_421_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        dst_mat_421_empty_n : IN STD_LOGIC;
        dst_mat_421_read : OUT STD_LOGIC;
        dst_TDATA : OUT STD_LOGIC_VECTOR (23 downto 0);
        dst_TVALID : OUT STD_LOGIC;
        dst_TREADY : IN STD_LOGIC;
        dst_TKEEP : OUT STD_LOGIC_VECTOR (2 downto 0);
        dst_TSTRB : OUT STD_LOGIC_VECTOR (2 downto 0);
        dst_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        dst_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
        dst_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
        dst_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component resize_accel_fifo_w32_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component resize_accel_fifo_w32_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component resize_accel_fifo_w24_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (23 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (23 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component resize_accel_start_for_xfMat2axis_24_9_2160_3840_1_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component resize_accel_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        src_rows : OUT STD_LOGIC_VECTOR (31 downto 0);
        src_cols : OUT STD_LOGIC_VECTOR (31 downto 0);
        dst_rows : OUT STD_LOGIC_VECTOR (31 downto 0);
        dst_cols : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        ap_local_deadlock : IN STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    control_s_axi_U : component resize_accel_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        src_rows => src_rows,
        src_cols => src_cols,
        dst_rows => dst_rows,
        dst_cols => dst_cols,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        ap_local_deadlock => ap_local_deadlock);

    Block_split1_proc_U0 : component resize_accel_Block_split1_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Block_split1_proc_U0_ap_start,
        ap_done => Block_split1_proc_U0_ap_done,
        ap_continue => Block_split1_proc_U0_ap_continue,
        ap_idle => Block_split1_proc_U0_ap_idle,
        ap_ready => Block_split1_proc_U0_ap_ready,
        src_rows => src_rows,
        src_cols => src_cols,
        dst_rows => dst_rows,
        dst_cols => dst_cols,
        ap_return_0 => Block_split1_proc_U0_ap_return_0,
        ap_return_1 => Block_split1_proc_U0_ap_return_1,
        ap_return_2 => Block_split1_proc_U0_ap_return_2,
        ap_return_3 => Block_split1_proc_U0_ap_return_3);

    axis2xfMat_24_9_2160_3840_1_U0 : component resize_accel_axis2xfMat_24_9_2160_3840_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => axis2xfMat_24_9_2160_3840_1_U0_ap_start,
        ap_done => axis2xfMat_24_9_2160_3840_1_U0_ap_done,
        ap_continue => axis2xfMat_24_9_2160_3840_1_U0_ap_continue,
        ap_idle => axis2xfMat_24_9_2160_3840_1_U0_ap_idle,
        ap_ready => axis2xfMat_24_9_2160_3840_1_U0_ap_ready,
        src_TDATA => src_TDATA,
        src_TVALID => src_TVALID,
        src_TREADY => axis2xfMat_24_9_2160_3840_1_U0_src_TREADY,
        src_TKEEP => src_TKEEP,
        src_TSTRB => src_TSTRB,
        src_TUSER => src_TUSER,
        src_TLAST => src_TLAST,
        src_TID => src_TID,
        src_TDEST => src_TDEST,
        p_read => src_mat_rows_c9_channel_dout,
        p_read1 => src_mat_cols_c10_channel_dout,
        src_mat_420_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din,
        src_mat_420_full_n => src_mat_data_full_n,
        src_mat_420_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write,
        src_mat_rows_c_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din,
        src_mat_rows_c_full_n => src_mat_rows_c_full_n,
        src_mat_rows_c_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write,
        src_mat_cols_c_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din,
        src_mat_cols_c_full_n => src_mat_cols_c_full_n,
        src_mat_cols_c_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write);

    resize_1_9_2160_3840_2160_3840_1_9_U0 : component resize_accel_resize_1_9_2160_3840_2160_3840_1_9_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start,
        start_full_n => start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n,
        ap_done => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_done,
        ap_continue => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue,
        ap_idle => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle,
        ap_ready => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready,
        start_out => resize_1_9_2160_3840_2160_3840_1_9_U0_start_out,
        start_write => resize_1_9_2160_3840_2160_3840_1_9_U0_start_write,
        p_src_rows_dout => src_mat_rows_c_dout,
        p_src_rows_empty_n => src_mat_rows_c_empty_n,
        p_src_rows_read => resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read,
        p_src_cols_dout => src_mat_cols_c_dout,
        p_src_cols_empty_n => src_mat_cols_c_empty_n,
        p_src_cols_read => resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read,
        src_mat_420_dout => src_mat_data_dout,
        src_mat_420_empty_n => src_mat_data_empty_n,
        src_mat_420_read => resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read,
        p_read => dst_mat_rows_c11_channel_dout,
        p_read1 => dst_mat_cols_c12_channel_dout,
        dst_mat_421_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din,
        dst_mat_421_full_n => dst_mat_data_full_n,
        dst_mat_421_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write,
        dst_mat_rows_c_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din,
        dst_mat_rows_c_full_n => dst_mat_rows_c_full_n,
        dst_mat_rows_c_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write,
        dst_mat_cols_c_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din,
        dst_mat_cols_c_full_n => dst_mat_cols_c_full_n,
        dst_mat_cols_c_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write);

    xfMat2axis_24_9_2160_3840_1_U0 : component resize_accel_xfMat2axis_24_9_2160_3840_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => xfMat2axis_24_9_2160_3840_1_U0_ap_start,
        ap_done => xfMat2axis_24_9_2160_3840_1_U0_ap_done,
        ap_continue => xfMat2axis_24_9_2160_3840_1_U0_ap_continue,
        ap_idle => xfMat2axis_24_9_2160_3840_1_U0_ap_idle,
        ap_ready => xfMat2axis_24_9_2160_3840_1_U0_ap_ready,
        img_rows_dout => dst_mat_rows_c_dout,
        img_rows_empty_n => dst_mat_rows_c_empty_n,
        img_rows_read => xfMat2axis_24_9_2160_3840_1_U0_img_rows_read,
        img_cols_dout => dst_mat_cols_c_dout,
        img_cols_empty_n => dst_mat_cols_c_empty_n,
        img_cols_read => xfMat2axis_24_9_2160_3840_1_U0_img_cols_read,
        dst_mat_421_dout => dst_mat_data_dout,
        dst_mat_421_empty_n => dst_mat_data_empty_n,
        dst_mat_421_read => xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read,
        dst_TDATA => xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA,
        dst_TVALID => xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID,
        dst_TREADY => dst_TREADY,
        dst_TKEEP => xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP,
        dst_TSTRB => xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB,
        dst_TUSER => xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER,
        dst_TLAST => xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST,
        dst_TID => xfMat2axis_24_9_2160_3840_1_U0_dst_TID,
        dst_TDEST => xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST);

    src_mat_rows_c9_channel_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_split1_proc_U0_ap_return_0,
        if_full_n => src_mat_rows_c9_channel_full_n,
        if_write => ap_channel_done_src_mat_rows_c9_channel,
        if_dout => src_mat_rows_c9_channel_dout,
        if_empty_n => src_mat_rows_c9_channel_empty_n,
        if_read => axis2xfMat_24_9_2160_3840_1_U0_ap_ready);

    src_mat_cols_c10_channel_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_split1_proc_U0_ap_return_1,
        if_full_n => src_mat_cols_c10_channel_full_n,
        if_write => ap_channel_done_src_mat_cols_c10_channel,
        if_dout => src_mat_cols_c10_channel_dout,
        if_empty_n => src_mat_cols_c10_channel_empty_n,
        if_read => axis2xfMat_24_9_2160_3840_1_U0_ap_ready);

    dst_mat_rows_c11_channel_U : component resize_accel_fifo_w32_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_split1_proc_U0_ap_return_2,
        if_full_n => dst_mat_rows_c11_channel_full_n,
        if_write => ap_channel_done_dst_mat_rows_c11_channel,
        if_dout => dst_mat_rows_c11_channel_dout,
        if_empty_n => dst_mat_rows_c11_channel_empty_n,
        if_read => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready);

    dst_mat_cols_c12_channel_U : component resize_accel_fifo_w32_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_split1_proc_U0_ap_return_3,
        if_full_n => dst_mat_cols_c12_channel_full_n,
        if_write => ap_channel_done_dst_mat_cols_c12_channel,
        if_dout => dst_mat_cols_c12_channel_dout,
        if_empty_n => dst_mat_cols_c12_channel_empty_n,
        if_read => resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready);

    src_mat_data_U : component resize_accel_fifo_w24_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din,
        if_full_n => src_mat_data_full_n,
        if_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write,
        if_dout => src_mat_data_dout,
        if_empty_n => src_mat_data_empty_n,
        if_read => resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read);

    src_mat_rows_c_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din,
        if_full_n => src_mat_rows_c_full_n,
        if_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write,
        if_dout => src_mat_rows_c_dout,
        if_empty_n => src_mat_rows_c_empty_n,
        if_read => resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read);

    src_mat_cols_c_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din,
        if_full_n => src_mat_cols_c_full_n,
        if_write => axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write,
        if_dout => src_mat_cols_c_dout,
        if_empty_n => src_mat_cols_c_empty_n,
        if_read => resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read);

    dst_mat_data_U : component resize_accel_fifo_w24_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din,
        if_full_n => dst_mat_data_full_n,
        if_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write,
        if_dout => dst_mat_data_dout,
        if_empty_n => dst_mat_data_empty_n,
        if_read => xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read);

    dst_mat_rows_c_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din,
        if_full_n => dst_mat_rows_c_full_n,
        if_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write,
        if_dout => dst_mat_rows_c_dout,
        if_empty_n => dst_mat_rows_c_empty_n,
        if_read => xfMat2axis_24_9_2160_3840_1_U0_img_rows_read);

    dst_mat_cols_c_U : component resize_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din,
        if_full_n => dst_mat_cols_c_full_n,
        if_write => resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write,
        if_dout => dst_mat_cols_c_dout,
        if_empty_n => dst_mat_cols_c_empty_n,
        if_read => xfMat2axis_24_9_2160_3840_1_U0_img_cols_read);

    start_for_xfMat2axis_24_9_2160_3840_1_U0_U : component resize_accel_start_for_xfMat2axis_24_9_2160_3840_1_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_xfMat2axis_24_9_2160_3840_1_U0_din,
        if_full_n => start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n,
        if_write => resize_1_9_2160_3840_2160_3840_1_9_U0_start_write,
        if_dout => start_for_xfMat2axis_24_9_2160_3840_1_U0_dout,
        if_empty_n => start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n,
        if_read => xfMat2axis_24_9_2160_3840_1_U0_ap_ready);





    ap_sync_reg_channel_write_dst_mat_cols_c12_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= ap_const_logic_0;
            else
                if (((Block_split1_proc_U0_ap_done and Block_split1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= ap_sync_channel_write_dst_mat_cols_c12_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_dst_mat_rows_c11_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= ap_const_logic_0;
            else
                if (((Block_split1_proc_U0_ap_done and Block_split1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= ap_sync_channel_write_dst_mat_rows_c11_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_src_mat_cols_c10_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_src_mat_cols_c10_channel <= ap_const_logic_0;
            else
                if (((Block_split1_proc_U0_ap_done and Block_split1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_src_mat_cols_c10_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_src_mat_cols_c10_channel <= ap_sync_channel_write_src_mat_cols_c10_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_src_mat_rows_c9_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_src_mat_rows_c9_channel <= ap_const_logic_0;
            else
                if (((Block_split1_proc_U0_ap_done and Block_split1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_src_mat_rows_c9_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_src_mat_rows_c9_channel <= ap_sync_channel_write_src_mat_rows_c9_channel;
                end if; 
            end if;
        end if;
    end process;

    Block_split1_proc_U0_ap_continue <= (ap_sync_channel_write_src_mat_rows_c9_channel and ap_sync_channel_write_src_mat_cols_c10_channel and ap_sync_channel_write_dst_mat_rows_c11_channel and ap_sync_channel_write_dst_mat_cols_c12_channel);
    Block_split1_proc_U0_ap_start <= ap_start;
    ap_channel_done_dst_mat_cols_c12_channel <= ((ap_sync_reg_channel_write_dst_mat_cols_c12_channel xor ap_const_logic_1) and Block_split1_proc_U0_ap_done);
    ap_channel_done_dst_mat_rows_c11_channel <= ((ap_sync_reg_channel_write_dst_mat_rows_c11_channel xor ap_const_logic_1) and Block_split1_proc_U0_ap_done);
    ap_channel_done_src_mat_cols_c10_channel <= ((ap_sync_reg_channel_write_src_mat_cols_c10_channel xor ap_const_logic_1) and Block_split1_proc_U0_ap_done);
    ap_channel_done_src_mat_rows_c9_channel <= ((ap_sync_reg_channel_write_src_mat_rows_c9_channel xor ap_const_logic_1) and Block_split1_proc_U0_ap_done);
    ap_done <= xfMat2axis_24_9_2160_3840_1_U0_ap_done;
    ap_idle <= (xfMat2axis_24_9_2160_3840_1_U0_ap_idle and resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle and (dst_mat_cols_c12_channel_empty_n xor ap_const_logic_1) and (dst_mat_rows_c11_channel_empty_n xor ap_const_logic_1) and (src_mat_cols_c10_channel_empty_n xor ap_const_logic_1) and (src_mat_rows_c9_channel_empty_n xor ap_const_logic_1) and axis2xfMat_24_9_2160_3840_1_U0_ap_idle and Block_split1_proc_U0_ap_idle);
    ap_local_block <= ap_const_logic_0;
    ap_local_deadlock <= ap_const_lv1_0;
    ap_ready <= Block_split1_proc_U0_ap_ready;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ap_sync_channel_write_dst_mat_cols_c12_channel <= ((dst_mat_cols_c12_channel_full_n and ap_channel_done_dst_mat_cols_c12_channel) or ap_sync_reg_channel_write_dst_mat_cols_c12_channel);
    ap_sync_channel_write_dst_mat_rows_c11_channel <= ((dst_mat_rows_c11_channel_full_n and ap_channel_done_dst_mat_rows_c11_channel) or ap_sync_reg_channel_write_dst_mat_rows_c11_channel);
    ap_sync_channel_write_src_mat_cols_c10_channel <= ((src_mat_cols_c10_channel_full_n and ap_channel_done_src_mat_cols_c10_channel) or ap_sync_reg_channel_write_src_mat_cols_c10_channel);
    ap_sync_channel_write_src_mat_rows_c9_channel <= ((src_mat_rows_c9_channel_full_n and ap_channel_done_src_mat_rows_c9_channel) or ap_sync_reg_channel_write_src_mat_rows_c9_channel);
    axis2xfMat_24_9_2160_3840_1_U0_ap_continue <= ap_const_logic_1;
    axis2xfMat_24_9_2160_3840_1_U0_ap_start <= (src_mat_rows_c9_channel_empty_n and src_mat_cols_c10_channel_empty_n);
    dst_TDATA <= xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA;
    dst_TDEST <= xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST;
    dst_TID <= xfMat2axis_24_9_2160_3840_1_U0_dst_TID;
    dst_TKEEP <= xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP;
    dst_TLAST <= xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST;
    dst_TSTRB <= xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB;
    dst_TUSER <= xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER;
    dst_TVALID <= xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID;
    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue <= ap_const_logic_1;
    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start <= (dst_mat_rows_c11_channel_empty_n and dst_mat_cols_c12_channel_empty_n);
    src_TREADY <= axis2xfMat_24_9_2160_3840_1_U0_src_TREADY;
    start_for_xfMat2axis_24_9_2160_3840_1_U0_din <= (0=>ap_const_logic_1, others=>'-');
    xfMat2axis_24_9_2160_3840_1_U0_ap_continue <= ap_const_logic_1;
    xfMat2axis_24_9_2160_3840_1_U0_ap_start <= start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n;
end behav;