// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="resize_accel_resize_accel,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=7.655250,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=36,HLS_SYN_DSP=0,HLS_SYN_FF=6396,HLS_SYN_LUT=5992,HLS_VERSION=2021_2}" *)

module resize_accel (
        ap_local_block,
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
        s_axi_control_BRESP,
        ap_clk,
        ap_rst_n,
        interrupt,
        src_TDATA,
        src_TKEEP,
        src_TSTRB,
        src_TUSER,
        src_TLAST,
        src_TID,
        src_TDEST,
        dst_TDATA,
        dst_TKEEP,
        dst_TSTRB,
        dst_TUSER,
        dst_TLAST,
        dst_TID,
        dst_TDEST,
        src_TVALID,
        src_TREADY,
        dst_TVALID,
        dst_TREADY
);

parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

output   ap_local_block;
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
input   ap_clk;
input   ap_rst_n;
output   interrupt;
input  [23:0] src_TDATA;
input  [2:0] src_TKEEP;
input  [2:0] src_TSTRB;
input  [0:0] src_TUSER;
input  [0:0] src_TLAST;
input  [0:0] src_TID;
input  [0:0] src_TDEST;
output  [23:0] dst_TDATA;
output  [2:0] dst_TKEEP;
output  [2:0] dst_TSTRB;
output  [0:0] dst_TUSER;
output  [0:0] dst_TLAST;
output  [0:0] dst_TID;
output  [0:0] dst_TDEST;
input   src_TVALID;
output   src_TREADY;
output   dst_TVALID;
input   dst_TREADY;

wire   [0:0] ap_local_deadlock;
 reg    ap_rst_n_inv;
wire   [31:0] src_rows;
wire   [31:0] src_cols;
wire   [31:0] dst_rows;
wire   [31:0] dst_cols;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_idle;
wire    Block_split1_proc_U0_ap_start;
wire    Block_split1_proc_U0_ap_done;
wire    Block_split1_proc_U0_ap_continue;
wire    Block_split1_proc_U0_ap_idle;
wire    Block_split1_proc_U0_ap_ready;
wire   [31:0] Block_split1_proc_U0_ap_return_0;
wire   [31:0] Block_split1_proc_U0_ap_return_1;
wire   [31:0] Block_split1_proc_U0_ap_return_2;
wire   [31:0] Block_split1_proc_U0_ap_return_3;
wire    ap_channel_done_dst_mat_cols_c12_channel;
wire    dst_mat_cols_c12_channel_full_n;
reg    ap_sync_reg_channel_write_dst_mat_cols_c12_channel;
wire    ap_sync_channel_write_dst_mat_cols_c12_channel;
wire    ap_channel_done_dst_mat_rows_c11_channel;
wire    dst_mat_rows_c11_channel_full_n;
reg    ap_sync_reg_channel_write_dst_mat_rows_c11_channel;
wire    ap_sync_channel_write_dst_mat_rows_c11_channel;
wire    ap_channel_done_src_mat_cols_c10_channel;
wire    src_mat_cols_c10_channel_full_n;
reg    ap_sync_reg_channel_write_src_mat_cols_c10_channel;
wire    ap_sync_channel_write_src_mat_cols_c10_channel;
wire    ap_channel_done_src_mat_rows_c9_channel;
wire    src_mat_rows_c9_channel_full_n;
reg    ap_sync_reg_channel_write_src_mat_rows_c9_channel;
wire    ap_sync_channel_write_src_mat_rows_c9_channel;
wire    axis2xfMat_24_9_2160_3840_1_U0_ap_start;
wire    axis2xfMat_24_9_2160_3840_1_U0_ap_done;
wire    axis2xfMat_24_9_2160_3840_1_U0_ap_continue;
wire    axis2xfMat_24_9_2160_3840_1_U0_ap_idle;
wire    axis2xfMat_24_9_2160_3840_1_U0_ap_ready;
wire    axis2xfMat_24_9_2160_3840_1_U0_src_TREADY;
wire   [23:0] axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din;
wire    axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write;
wire   [31:0] axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din;
wire    axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write;
wire   [31:0] axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din;
wire    axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_done;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_start_out;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_start_write;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read;
wire   [23:0] resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write;
wire   [31:0] resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write;
wire   [31:0] resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din;
wire    resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write;
wire    xfMat2axis_24_9_2160_3840_1_U0_ap_start;
wire    xfMat2axis_24_9_2160_3840_1_U0_ap_done;
wire    xfMat2axis_24_9_2160_3840_1_U0_ap_continue;
wire    xfMat2axis_24_9_2160_3840_1_U0_ap_idle;
wire    xfMat2axis_24_9_2160_3840_1_U0_ap_ready;
wire    xfMat2axis_24_9_2160_3840_1_U0_img_rows_read;
wire    xfMat2axis_24_9_2160_3840_1_U0_img_cols_read;
wire    xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read;
wire   [23:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA;
wire    xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID;
wire   [2:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP;
wire   [2:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB;
wire   [0:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER;
wire   [0:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST;
wire   [0:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TID;
wire   [0:0] xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST;
wire   [31:0] src_mat_rows_c9_channel_dout;
wire    src_mat_rows_c9_channel_empty_n;
wire   [31:0] src_mat_cols_c10_channel_dout;
wire    src_mat_cols_c10_channel_empty_n;
wire   [31:0] dst_mat_rows_c11_channel_dout;
wire    dst_mat_rows_c11_channel_empty_n;
wire   [31:0] dst_mat_cols_c12_channel_dout;
wire    dst_mat_cols_c12_channel_empty_n;
wire    src_mat_data_full_n;
wire   [23:0] src_mat_data_dout;
wire    src_mat_data_empty_n;
wire    src_mat_rows_c_full_n;
wire   [31:0] src_mat_rows_c_dout;
wire    src_mat_rows_c_empty_n;
wire    src_mat_cols_c_full_n;
wire   [31:0] src_mat_cols_c_dout;
wire    src_mat_cols_c_empty_n;
wire    dst_mat_data_full_n;
wire   [23:0] dst_mat_data_dout;
wire    dst_mat_data_empty_n;
wire    dst_mat_rows_c_full_n;
wire   [31:0] dst_mat_rows_c_dout;
wire    dst_mat_rows_c_empty_n;
wire    dst_mat_cols_c_full_n;
wire   [31:0] dst_mat_cols_c_dout;
wire    dst_mat_cols_c_empty_n;
wire   [0:0] start_for_xfMat2axis_24_9_2160_3840_1_U0_din;
wire    start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n;
wire   [0:0] start_for_xfMat2axis_24_9_2160_3840_1_U0_dout;
wire    start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_dst_mat_cols_c12_channel = 1'b0;
#0 ap_sync_reg_channel_write_dst_mat_rows_c11_channel = 1'b0;
#0 ap_sync_reg_channel_write_src_mat_cols_c10_channel = 1'b0;
#0 ap_sync_reg_channel_write_src_mat_rows_c9_channel = 1'b0;
end

resize_accel_control_s_axi #(
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
    .src_rows(src_rows),
    .src_cols(src_cols),
    .dst_rows(dst_rows),
    .dst_cols(dst_cols),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_local_deadlock(ap_local_deadlock)
);

resize_accel_Block_split1_proc Block_split1_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_split1_proc_U0_ap_start),
    .ap_done(Block_split1_proc_U0_ap_done),
    .ap_continue(Block_split1_proc_U0_ap_continue),
    .ap_idle(Block_split1_proc_U0_ap_idle),
    .ap_ready(Block_split1_proc_U0_ap_ready),
    .src_rows(src_rows),
    .src_cols(src_cols),
    .dst_rows(dst_rows),
    .dst_cols(dst_cols),
    .ap_return_0(Block_split1_proc_U0_ap_return_0),
    .ap_return_1(Block_split1_proc_U0_ap_return_1),
    .ap_return_2(Block_split1_proc_U0_ap_return_2),
    .ap_return_3(Block_split1_proc_U0_ap_return_3)
);

resize_accel_axis2xfMat_24_9_2160_3840_1_s axis2xfMat_24_9_2160_3840_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(axis2xfMat_24_9_2160_3840_1_U0_ap_start),
    .ap_done(axis2xfMat_24_9_2160_3840_1_U0_ap_done),
    .ap_continue(axis2xfMat_24_9_2160_3840_1_U0_ap_continue),
    .ap_idle(axis2xfMat_24_9_2160_3840_1_U0_ap_idle),
    .ap_ready(axis2xfMat_24_9_2160_3840_1_U0_ap_ready),
    .src_TDATA(src_TDATA),
    .src_TVALID(src_TVALID),
    .src_TREADY(axis2xfMat_24_9_2160_3840_1_U0_src_TREADY),
    .src_TKEEP(src_TKEEP),
    .src_TSTRB(src_TSTRB),
    .src_TUSER(src_TUSER),
    .src_TLAST(src_TLAST),
    .src_TID(src_TID),
    .src_TDEST(src_TDEST),
    .p_read(src_mat_rows_c9_channel_dout),
    .p_read1(src_mat_cols_c10_channel_dout),
    .src_mat_420_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din),
    .src_mat_420_full_n(src_mat_data_full_n),
    .src_mat_420_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write),
    .src_mat_rows_c_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din),
    .src_mat_rows_c_full_n(src_mat_rows_c_full_n),
    .src_mat_rows_c_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write),
    .src_mat_cols_c_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din),
    .src_mat_cols_c_full_n(src_mat_cols_c_full_n),
    .src_mat_cols_c_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write)
);

resize_accel_resize_1_9_2160_3840_2160_3840_1_9_s resize_1_9_2160_3840_2160_3840_1_9_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start),
    .start_full_n(start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n),
    .ap_done(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_done),
    .ap_continue(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue),
    .ap_idle(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle),
    .ap_ready(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready),
    .start_out(resize_1_9_2160_3840_2160_3840_1_9_U0_start_out),
    .start_write(resize_1_9_2160_3840_2160_3840_1_9_U0_start_write),
    .p_src_rows_dout(src_mat_rows_c_dout),
    .p_src_rows_empty_n(src_mat_rows_c_empty_n),
    .p_src_rows_read(resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read),
    .p_src_cols_dout(src_mat_cols_c_dout),
    .p_src_cols_empty_n(src_mat_cols_c_empty_n),
    .p_src_cols_read(resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read),
    .src_mat_420_dout(src_mat_data_dout),
    .src_mat_420_empty_n(src_mat_data_empty_n),
    .src_mat_420_read(resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read),
    .p_read(dst_mat_rows_c11_channel_dout),
    .p_read1(dst_mat_cols_c12_channel_dout),
    .dst_mat_421_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din),
    .dst_mat_421_full_n(dst_mat_data_full_n),
    .dst_mat_421_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write),
    .dst_mat_rows_c_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din),
    .dst_mat_rows_c_full_n(dst_mat_rows_c_full_n),
    .dst_mat_rows_c_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write),
    .dst_mat_cols_c_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din),
    .dst_mat_cols_c_full_n(dst_mat_cols_c_full_n),
    .dst_mat_cols_c_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write)
);

resize_accel_xfMat2axis_24_9_2160_3840_1_s xfMat2axis_24_9_2160_3840_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(xfMat2axis_24_9_2160_3840_1_U0_ap_start),
    .ap_done(xfMat2axis_24_9_2160_3840_1_U0_ap_done),
    .ap_continue(xfMat2axis_24_9_2160_3840_1_U0_ap_continue),
    .ap_idle(xfMat2axis_24_9_2160_3840_1_U0_ap_idle),
    .ap_ready(xfMat2axis_24_9_2160_3840_1_U0_ap_ready),
    .img_rows_dout(dst_mat_rows_c_dout),
    .img_rows_empty_n(dst_mat_rows_c_empty_n),
    .img_rows_read(xfMat2axis_24_9_2160_3840_1_U0_img_rows_read),
    .img_cols_dout(dst_mat_cols_c_dout),
    .img_cols_empty_n(dst_mat_cols_c_empty_n),
    .img_cols_read(xfMat2axis_24_9_2160_3840_1_U0_img_cols_read),
    .dst_mat_421_dout(dst_mat_data_dout),
    .dst_mat_421_empty_n(dst_mat_data_empty_n),
    .dst_mat_421_read(xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read),
    .dst_TDATA(xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA),
    .dst_TVALID(xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID),
    .dst_TREADY(dst_TREADY),
    .dst_TKEEP(xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP),
    .dst_TSTRB(xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB),
    .dst_TUSER(xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER),
    .dst_TLAST(xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST),
    .dst_TID(xfMat2axis_24_9_2160_3840_1_U0_dst_TID),
    .dst_TDEST(xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST)
);

resize_accel_fifo_w32_d2_S src_mat_rows_c9_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_split1_proc_U0_ap_return_0),
    .if_full_n(src_mat_rows_c9_channel_full_n),
    .if_write(ap_channel_done_src_mat_rows_c9_channel),
    .if_dout(src_mat_rows_c9_channel_dout),
    .if_empty_n(src_mat_rows_c9_channel_empty_n),
    .if_read(axis2xfMat_24_9_2160_3840_1_U0_ap_ready)
);

resize_accel_fifo_w32_d2_S src_mat_cols_c10_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_split1_proc_U0_ap_return_1),
    .if_full_n(src_mat_cols_c10_channel_full_n),
    .if_write(ap_channel_done_src_mat_cols_c10_channel),
    .if_dout(src_mat_cols_c10_channel_dout),
    .if_empty_n(src_mat_cols_c10_channel_empty_n),
    .if_read(axis2xfMat_24_9_2160_3840_1_U0_ap_ready)
);

resize_accel_fifo_w32_d3_S dst_mat_rows_c11_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_split1_proc_U0_ap_return_2),
    .if_full_n(dst_mat_rows_c11_channel_full_n),
    .if_write(ap_channel_done_dst_mat_rows_c11_channel),
    .if_dout(dst_mat_rows_c11_channel_dout),
    .if_empty_n(dst_mat_rows_c11_channel_empty_n),
    .if_read(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready)
);

resize_accel_fifo_w32_d3_S dst_mat_cols_c12_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_split1_proc_U0_ap_return_3),
    .if_full_n(dst_mat_cols_c12_channel_full_n),
    .if_write(ap_channel_done_dst_mat_cols_c12_channel),
    .if_dout(dst_mat_cols_c12_channel_dout),
    .if_empty_n(dst_mat_cols_c12_channel_empty_n),
    .if_read(resize_1_9_2160_3840_2160_3840_1_9_U0_ap_ready)
);

resize_accel_fifo_w24_d2_S src_mat_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_din),
    .if_full_n(src_mat_data_full_n),
    .if_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_420_write),
    .if_dout(src_mat_data_dout),
    .if_empty_n(src_mat_data_empty_n),
    .if_read(resize_1_9_2160_3840_2160_3840_1_9_U0_src_mat_420_read)
);

resize_accel_fifo_w32_d2_S src_mat_rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_din),
    .if_full_n(src_mat_rows_c_full_n),
    .if_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_rows_c_write),
    .if_dout(src_mat_rows_c_dout),
    .if_empty_n(src_mat_rows_c_empty_n),
    .if_read(resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_rows_read)
);

resize_accel_fifo_w32_d2_S src_mat_cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_din),
    .if_full_n(src_mat_cols_c_full_n),
    .if_write(axis2xfMat_24_9_2160_3840_1_U0_src_mat_cols_c_write),
    .if_dout(src_mat_cols_c_dout),
    .if_empty_n(src_mat_cols_c_empty_n),
    .if_read(resize_1_9_2160_3840_2160_3840_1_9_U0_p_src_cols_read)
);

resize_accel_fifo_w24_d2_S dst_mat_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_din),
    .if_full_n(dst_mat_data_full_n),
    .if_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_421_write),
    .if_dout(dst_mat_data_dout),
    .if_empty_n(dst_mat_data_empty_n),
    .if_read(xfMat2axis_24_9_2160_3840_1_U0_dst_mat_421_read)
);

resize_accel_fifo_w32_d2_S dst_mat_rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_din),
    .if_full_n(dst_mat_rows_c_full_n),
    .if_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_rows_c_write),
    .if_dout(dst_mat_rows_c_dout),
    .if_empty_n(dst_mat_rows_c_empty_n),
    .if_read(xfMat2axis_24_9_2160_3840_1_U0_img_rows_read)
);

resize_accel_fifo_w32_d2_S dst_mat_cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_din),
    .if_full_n(dst_mat_cols_c_full_n),
    .if_write(resize_1_9_2160_3840_2160_3840_1_9_U0_dst_mat_cols_c_write),
    .if_dout(dst_mat_cols_c_dout),
    .if_empty_n(dst_mat_cols_c_empty_n),
    .if_read(xfMat2axis_24_9_2160_3840_1_U0_img_cols_read)
);

resize_accel_start_for_xfMat2axis_24_9_2160_3840_1_U0 start_for_xfMat2axis_24_9_2160_3840_1_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_xfMat2axis_24_9_2160_3840_1_U0_din),
    .if_full_n(start_for_xfMat2axis_24_9_2160_3840_1_U0_full_n),
    .if_write(resize_1_9_2160_3840_2160_3840_1_9_U0_start_write),
    .if_dout(start_for_xfMat2axis_24_9_2160_3840_1_U0_dout),
    .if_empty_n(start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n),
    .if_read(xfMat2axis_24_9_2160_3840_1_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= 1'b0;
    end else begin
        if (((Block_split1_proc_U0_ap_done & Block_split1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_dst_mat_cols_c12_channel <= ap_sync_channel_write_dst_mat_cols_c12_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= 1'b0;
    end else begin
        if (((Block_split1_proc_U0_ap_done & Block_split1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_dst_mat_rows_c11_channel <= ap_sync_channel_write_dst_mat_rows_c11_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_src_mat_cols_c10_channel <= 1'b0;
    end else begin
        if (((Block_split1_proc_U0_ap_done & Block_split1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_src_mat_cols_c10_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_src_mat_cols_c10_channel <= ap_sync_channel_write_src_mat_cols_c10_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_src_mat_rows_c9_channel <= 1'b0;
    end else begin
        if (((Block_split1_proc_U0_ap_done & Block_split1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_src_mat_rows_c9_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_src_mat_rows_c9_channel <= ap_sync_channel_write_src_mat_rows_c9_channel;
        end
    end
end

assign Block_split1_proc_U0_ap_continue = (ap_sync_channel_write_src_mat_rows_c9_channel & ap_sync_channel_write_src_mat_cols_c10_channel & ap_sync_channel_write_dst_mat_rows_c11_channel & ap_sync_channel_write_dst_mat_cols_c12_channel);

assign Block_split1_proc_U0_ap_start = ap_start;

assign ap_channel_done_dst_mat_cols_c12_channel = ((ap_sync_reg_channel_write_dst_mat_cols_c12_channel ^ 1'b1) & Block_split1_proc_U0_ap_done);

assign ap_channel_done_dst_mat_rows_c11_channel = ((ap_sync_reg_channel_write_dst_mat_rows_c11_channel ^ 1'b1) & Block_split1_proc_U0_ap_done);

assign ap_channel_done_src_mat_cols_c10_channel = ((ap_sync_reg_channel_write_src_mat_cols_c10_channel ^ 1'b1) & Block_split1_proc_U0_ap_done);

assign ap_channel_done_src_mat_rows_c9_channel = ((ap_sync_reg_channel_write_src_mat_rows_c9_channel ^ 1'b1) & Block_split1_proc_U0_ap_done);

assign ap_done = xfMat2axis_24_9_2160_3840_1_U0_ap_done;

assign ap_idle = (xfMat2axis_24_9_2160_3840_1_U0_ap_idle & resize_1_9_2160_3840_2160_3840_1_9_U0_ap_idle & (dst_mat_cols_c12_channel_empty_n ^ 1'b1) & (dst_mat_rows_c11_channel_empty_n ^ 1'b1) & (src_mat_cols_c10_channel_empty_n ^ 1'b1) & (src_mat_rows_c9_channel_empty_n ^ 1'b1) & axis2xfMat_24_9_2160_3840_1_U0_ap_idle & Block_split1_proc_U0_ap_idle);

assign ap_local_block = 1'b0;

assign ap_local_deadlock = 1'd0;

assign ap_ready = Block_split1_proc_U0_ap_ready;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_channel_write_dst_mat_cols_c12_channel = ((dst_mat_cols_c12_channel_full_n & ap_channel_done_dst_mat_cols_c12_channel) | ap_sync_reg_channel_write_dst_mat_cols_c12_channel);

assign ap_sync_channel_write_dst_mat_rows_c11_channel = ((dst_mat_rows_c11_channel_full_n & ap_channel_done_dst_mat_rows_c11_channel) | ap_sync_reg_channel_write_dst_mat_rows_c11_channel);

assign ap_sync_channel_write_src_mat_cols_c10_channel = ((src_mat_cols_c10_channel_full_n & ap_channel_done_src_mat_cols_c10_channel) | ap_sync_reg_channel_write_src_mat_cols_c10_channel);

assign ap_sync_channel_write_src_mat_rows_c9_channel = ((src_mat_rows_c9_channel_full_n & ap_channel_done_src_mat_rows_c9_channel) | ap_sync_reg_channel_write_src_mat_rows_c9_channel);

assign axis2xfMat_24_9_2160_3840_1_U0_ap_continue = 1'b1;

assign axis2xfMat_24_9_2160_3840_1_U0_ap_start = (src_mat_rows_c9_channel_empty_n & src_mat_cols_c10_channel_empty_n);

assign dst_TDATA = xfMat2axis_24_9_2160_3840_1_U0_dst_TDATA;

assign dst_TDEST = xfMat2axis_24_9_2160_3840_1_U0_dst_TDEST;

assign dst_TID = xfMat2axis_24_9_2160_3840_1_U0_dst_TID;

assign dst_TKEEP = xfMat2axis_24_9_2160_3840_1_U0_dst_TKEEP;

assign dst_TLAST = xfMat2axis_24_9_2160_3840_1_U0_dst_TLAST;

assign dst_TSTRB = xfMat2axis_24_9_2160_3840_1_U0_dst_TSTRB;

assign dst_TUSER = xfMat2axis_24_9_2160_3840_1_U0_dst_TUSER;

assign dst_TVALID = xfMat2axis_24_9_2160_3840_1_U0_dst_TVALID;

assign resize_1_9_2160_3840_2160_3840_1_9_U0_ap_continue = 1'b1;

assign resize_1_9_2160_3840_2160_3840_1_9_U0_ap_start = (dst_mat_rows_c11_channel_empty_n & dst_mat_cols_c12_channel_empty_n);

assign src_TREADY = axis2xfMat_24_9_2160_3840_1_U0_src_TREADY;

assign start_for_xfMat2axis_24_9_2160_3840_1_U0_din = 1'b1;

assign xfMat2axis_24_9_2160_3840_1_U0_ap_continue = 1'b1;

assign xfMat2axis_24_9_2160_3840_1_U0_ap_start = start_for_xfMat2axis_24_9_2160_3840_1_U0_empty_n;

endmodule //resize_accel
