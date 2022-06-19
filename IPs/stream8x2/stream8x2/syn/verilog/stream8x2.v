// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="stream8x2_stream8x2,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.552000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=180,HLS_SYN_LUT=288,HLS_VERSION=2021_2}" *)

module stream8x2 (
        ap_local_block,
        ap_clk,
        ap_rst_n,
        src_TDATA,
        src_TVALID,
        src_TREADY,
        src_TKEEP,
        src_TSTRB,
        src_TUSER,
        src_TLAST,
        src_TID,
        src_TDEST,
        dst1_TDATA,
        dst1_TVALID,
        dst1_TREADY,
        dst1_TKEEP,
        dst1_TSTRB,
        dst1_TUSER,
        dst1_TLAST,
        dst1_TID,
        dst1_TDEST,
        dst2_TDATA,
        dst2_TVALID,
        dst2_TREADY,
        dst2_TKEEP,
        dst2_TSTRB,
        dst2_TUSER,
        dst2_TLAST,
        dst2_TID,
        dst2_TDEST,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

output   ap_local_block;
input   ap_clk;
input   ap_rst_n;
input  [7:0] src_TDATA;
input   src_TVALID;
output   src_TREADY;
input  [0:0] src_TKEEP;
input  [0:0] src_TSTRB;
input  [0:0] src_TUSER;
input  [0:0] src_TLAST;
input  [0:0] src_TID;
input  [0:0] src_TDEST;
output  [7:0] dst1_TDATA;
output   dst1_TVALID;
input   dst1_TREADY;
output  [0:0] dst1_TKEEP;
output  [0:0] dst1_TSTRB;
output  [0:0] dst1_TUSER;
output  [0:0] dst1_TLAST;
output  [0:0] dst1_TID;
output  [0:0] dst1_TDEST;
output  [7:0] dst2_TDATA;
output   dst2_TVALID;
input   dst2_TREADY;
output  [0:0] dst2_TKEEP;
output  [0:0] dst2_TSTRB;
output  [0:0] dst2_TUSER;
output  [0:0] dst2_TLAST;
output  [0:0] dst2_TID;
output  [0:0] dst2_TDEST;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;

wire   [0:0] ap_local_deadlock;
 reg    ap_rst_n_inv;
wire   [31:0] recv;
reg    recv_ap_vld;
wire   [31:0] send;
reg    send_ap_vld;
reg   [31:0] recv_reg;
reg   [31:0] send_reg;
reg    dst1_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
reg   [0:0] p_vld_reg_248;
reg    dst2_TDATA_blk_n;
wire   [31:0] add_ln21_fu_218_p2;
reg    ap_block_state1;
reg    ap_block_state1_io;
wire   [31:0] add_ln24_fu_235_p2;
wire   [0:0] empty_nbread_fu_86_p8_0;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    regslice_both_dst1_V_data_V_U_apdone_blk;
wire    regslice_both_dst2_V_data_V_U_apdone_blk;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire    regslice_both_src_V_data_V_U_apdone_blk;
wire   [7:0] src_TDATA_int_regslice;
wire    src_TVALID_int_regslice;
reg    src_TREADY_int_regslice;
wire    regslice_both_src_V_data_V_U_ack_in;
wire    regslice_both_src_V_keep_V_U_apdone_blk;
wire   [0:0] src_TKEEP_int_regslice;
wire    regslice_both_src_V_keep_V_U_vld_out;
wire    regslice_both_src_V_keep_V_U_ack_in;
wire    regslice_both_src_V_strb_V_U_apdone_blk;
wire   [0:0] src_TSTRB_int_regslice;
wire    regslice_both_src_V_strb_V_U_vld_out;
wire    regslice_both_src_V_strb_V_U_ack_in;
wire    regslice_both_src_V_user_V_U_apdone_blk;
wire   [0:0] src_TUSER_int_regslice;
wire    regslice_both_src_V_user_V_U_vld_out;
wire    regslice_both_src_V_user_V_U_ack_in;
wire    regslice_both_src_V_last_V_U_apdone_blk;
wire   [0:0] src_TLAST_int_regslice;
wire    regslice_both_src_V_last_V_U_vld_out;
wire    regslice_both_src_V_last_V_U_ack_in;
wire    regslice_both_src_V_id_V_U_apdone_blk;
wire   [0:0] src_TID_int_regslice;
wire    regslice_both_src_V_id_V_U_vld_out;
wire    regslice_both_src_V_id_V_U_ack_in;
wire    regslice_both_src_V_dest_V_U_apdone_blk;
wire   [0:0] src_TDEST_int_regslice;
wire    regslice_both_src_V_dest_V_U_vld_out;
wire    regslice_both_src_V_dest_V_U_ack_in;
reg    dst1_TVALID_int_regslice;
wire    dst1_TREADY_int_regslice;
wire    regslice_both_dst1_V_data_V_U_vld_out;
wire    regslice_both_dst1_V_keep_V_U_apdone_blk;
wire    regslice_both_dst1_V_keep_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_keep_V_U_vld_out;
wire    regslice_both_dst1_V_strb_V_U_apdone_blk;
wire    regslice_both_dst1_V_strb_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_strb_V_U_vld_out;
wire    regslice_both_dst1_V_user_V_U_apdone_blk;
wire    regslice_both_dst1_V_user_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_user_V_U_vld_out;
wire    regslice_both_dst1_V_last_V_U_apdone_blk;
wire    regslice_both_dst1_V_last_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_last_V_U_vld_out;
wire    regslice_both_dst1_V_id_V_U_apdone_blk;
wire    regslice_both_dst1_V_id_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_id_V_U_vld_out;
wire    regslice_both_dst1_V_dest_V_U_apdone_blk;
wire    regslice_both_dst1_V_dest_V_U_ack_in_dummy;
wire    regslice_both_dst1_V_dest_V_U_vld_out;
reg    dst2_TVALID_int_regslice;
wire    dst2_TREADY_int_regslice;
wire    regslice_both_dst2_V_data_V_U_vld_out;
wire    regslice_both_dst2_V_keep_V_U_apdone_blk;
wire    regslice_both_dst2_V_keep_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_keep_V_U_vld_out;
wire    regslice_both_dst2_V_strb_V_U_apdone_blk;
wire    regslice_both_dst2_V_strb_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_strb_V_U_vld_out;
wire    regslice_both_dst2_V_user_V_U_apdone_blk;
wire    regslice_both_dst2_V_user_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_user_V_U_vld_out;
wire    regslice_both_dst2_V_last_V_U_apdone_blk;
wire    regslice_both_dst2_V_last_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_last_V_U_vld_out;
wire    regslice_both_dst2_V_id_V_U_apdone_blk;
wire    regslice_both_dst2_V_id_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_id_V_U_vld_out;
wire    regslice_both_dst2_V_dest_V_U_apdone_blk;
wire    regslice_both_dst2_V_dest_V_U_ack_in_dummy;
wire    regslice_both_dst2_V_dest_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 recv_reg = 32'd0;
#0 send_reg = 32'd0;
#0 ap_CS_fsm = 2'd1;
end

stream8x2_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .recv(recv),
    .recv_ap_vld(recv_ap_vld),
    .send(send),
    .send_ap_vld(send_ap_vld),
    .ap_local_deadlock(ap_local_deadlock)
);

stream8x2_regslice_both #(
    .DataWidth( 8 ))
regslice_both_src_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDATA),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_data_V_U_ack_in),
    .data_out(src_TDATA_int_regslice),
    .vld_out(src_TVALID_int_regslice),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_data_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TKEEP),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_keep_V_U_ack_in),
    .data_out(src_TKEEP_int_regslice),
    .vld_out(regslice_both_src_V_keep_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_keep_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TSTRB),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_strb_V_U_ack_in),
    .data_out(src_TSTRB_int_regslice),
    .vld_out(regslice_both_src_V_strb_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_strb_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TUSER),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_user_V_U_ack_in),
    .data_out(src_TUSER_int_regslice),
    .vld_out(regslice_both_src_V_user_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_user_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TLAST),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_last_V_U_ack_in),
    .data_out(src_TLAST_int_regslice),
    .vld_out(regslice_both_src_V_last_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_last_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TID),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_id_V_U_ack_in),
    .data_out(src_TID_int_regslice),
    .vld_out(regslice_both_src_V_id_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_id_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_src_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDEST),
    .vld_in(src_TVALID),
    .ack_in(regslice_both_src_V_dest_V_U_ack_in),
    .data_out(src_TDEST_int_regslice),
    .vld_out(regslice_both_src_V_dest_V_U_vld_out),
    .ack_out(src_TREADY_int_regslice),
    .apdone_blk(regslice_both_src_V_dest_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 8 ))
regslice_both_dst1_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDATA_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(dst1_TREADY_int_regslice),
    .data_out(dst1_TDATA),
    .vld_out(regslice_both_dst1_V_data_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_data_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TKEEP_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_keep_V_U_ack_in_dummy),
    .data_out(dst1_TKEEP),
    .vld_out(regslice_both_dst1_V_keep_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_keep_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TSTRB_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_strb_V_U_ack_in_dummy),
    .data_out(dst1_TSTRB),
    .vld_out(regslice_both_dst1_V_strb_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_strb_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TUSER_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_user_V_U_ack_in_dummy),
    .data_out(dst1_TUSER),
    .vld_out(regslice_both_dst1_V_user_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_user_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TLAST_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_last_V_U_ack_in_dummy),
    .data_out(dst1_TLAST),
    .vld_out(regslice_both_dst1_V_last_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_last_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TID_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_id_V_U_ack_in_dummy),
    .data_out(dst1_TID),
    .vld_out(regslice_both_dst1_V_id_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_id_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst1_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDEST_int_regslice),
    .vld_in(dst1_TVALID_int_regslice),
    .ack_in(regslice_both_dst1_V_dest_V_U_ack_in_dummy),
    .data_out(dst1_TDEST),
    .vld_out(regslice_both_dst1_V_dest_V_U_vld_out),
    .ack_out(dst1_TREADY),
    .apdone_blk(regslice_both_dst1_V_dest_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 8 ))
regslice_both_dst2_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDATA_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(dst2_TREADY_int_regslice),
    .data_out(dst2_TDATA),
    .vld_out(regslice_both_dst2_V_data_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_data_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TKEEP_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_keep_V_U_ack_in_dummy),
    .data_out(dst2_TKEEP),
    .vld_out(regslice_both_dst2_V_keep_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_keep_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TSTRB_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_strb_V_U_ack_in_dummy),
    .data_out(dst2_TSTRB),
    .vld_out(regslice_both_dst2_V_strb_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_strb_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TUSER_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_user_V_U_ack_in_dummy),
    .data_out(dst2_TUSER),
    .vld_out(regslice_both_dst2_V_user_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_user_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TLAST_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_last_V_U_ack_in_dummy),
    .data_out(dst2_TLAST),
    .vld_out(regslice_both_dst2_V_last_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_last_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TID_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_id_V_U_ack_in_dummy),
    .data_out(dst2_TID),
    .vld_out(regslice_both_dst2_V_id_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_id_V_U_apdone_blk)
);

stream8x2_regslice_both #(
    .DataWidth( 1 ))
regslice_both_dst2_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(src_TDEST_int_regslice),
    .vld_in(dst2_TVALID_int_regslice),
    .ack_in(regslice_both_dst2_V_dest_V_U_ack_in_dummy),
    .data_out(dst2_TDEST),
    .vld_out(regslice_both_dst2_V_dest_V_U_vld_out),
    .ack_out(dst2_TREADY),
    .apdone_blk(regslice_both_dst2_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        p_vld_reg_248 <= empty_nbread_fu_86_p8_0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1))) begin
        recv_reg <= add_ln21_fu_218_p2;
        send_reg <= add_ln24_fu_235_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | (regslice_both_dst2_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_dst1_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_248 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((p_vld_reg_248 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((p_vld_reg_248 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1)))) begin
        dst1_TDATA_blk_n = dst1_TREADY_int_regslice;
    end else begin
        dst1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1))) begin
        dst1_TVALID_int_regslice = 1'b1;
    end else begin
        dst1_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((p_vld_reg_248 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1)))) begin
        dst2_TDATA_blk_n = dst2_TREADY_int_regslice;
    end else begin
        dst2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1))) begin
        dst2_TVALID_int_regslice = 1'b1;
    end else begin
        dst2_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1))) begin
        recv_ap_vld = 1'b1;
    end else begin
        recv_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (empty_nbread_fu_86_p8_0 == 1'd1))) begin
        send_ap_vld = 1'b1;
    end else begin
        send_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (src_TVALID_int_regslice == 1'b1))) begin
        src_TREADY_int_regslice = 1'b1;
    end else begin
        src_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b1 == ap_block_state1_io) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | (regslice_both_dst2_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_dst1_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_248 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((p_vld_reg_248 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln21_fu_218_p2 = (recv_reg + 32'd1);

assign add_ln24_fu_235_p2 = (send_reg + 32'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = (((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state1_io = (((empty_nbread_fu_86_p8_0 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((empty_nbread_fu_86_p8_0 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2 = ((regslice_both_dst2_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_dst1_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_248 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((p_vld_reg_248 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = (((p_vld_reg_248 == 1'd1) & (dst2_TREADY_int_regslice == 1'b0)) | ((p_vld_reg_248 == 1'd1) & (dst1_TREADY_int_regslice == 1'b0)));
end

assign ap_local_block = 1'b0;

assign ap_local_deadlock = 1'd0;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign dst1_TVALID = regslice_both_dst1_V_data_V_U_vld_out;

assign dst2_TVALID = regslice_both_dst2_V_data_V_U_vld_out;

assign empty_nbread_fu_86_p8_0 = src_TVALID_int_regslice;

assign recv = (recv_reg + 32'd1);

assign send = (send_reg + 32'd1);

assign src_TREADY = regslice_both_src_V_data_V_U_ack_in;

endmodule //stream8x2
