// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="stream8rto8_stream8rto8,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.552000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=180,HLS_SYN_LUT=279,HLS_VERSION=2021_2}" *)

module stream8rto8 (
        ap_local_block,
        ap_clk,
        ap_rst_n,
        pin8_TDATA,
        pin8_TVALID,
        pin8_TREADY,
        pout8_TDATA,
        pout8_TVALID,
        pout8_TREADY,
        pout8_TKEEP,
        pout8_TSTRB,
        pout8_TLAST,
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
input  [7:0] pin8_TDATA;
input   pin8_TVALID;
output   pin8_TREADY;
output  [7:0] pout8_TDATA;
output   pout8_TVALID;
input   pout8_TREADY;
output  [0:0] pout8_TKEEP;
output  [0:0] pout8_TSTRB;
output  [0:0] pout8_TLAST;
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
reg    pout8_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
reg   [0:0] p_vld_reg_138;
wire   [31:0] add_ln13_fu_108_p2;
reg    ap_block_state1;
reg    ap_block_state1_io;
wire   [31:0] add_ln20_fu_125_p2;
wire   [0:0] pin8_read_nbread_fu_56_p2_0;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    regslice_both_pout8_V_data_V_U_apdone_blk;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire    regslice_both_pin8_U_apdone_blk;
wire   [7:0] pin8_TDATA_int_regslice;
wire    pin8_TVALID_int_regslice;
reg    pin8_TREADY_int_regslice;
wire    regslice_both_pin8_U_ack_in;
reg    pout8_TVALID_int_regslice;
wire    pout8_TREADY_int_regslice;
wire    regslice_both_pout8_V_data_V_U_vld_out;
wire    regslice_both_pout8_V_keep_V_U_apdone_blk;
wire    regslice_both_pout8_V_keep_V_U_ack_in_dummy;
wire    regslice_both_pout8_V_keep_V_U_vld_out;
wire    regslice_both_pout8_V_strb_V_U_apdone_blk;
wire    regslice_both_pout8_V_strb_V_U_ack_in_dummy;
wire    regslice_both_pout8_V_strb_V_U_vld_out;
wire    regslice_both_pout8_V_last_V_U_apdone_blk;
wire    regslice_both_pout8_V_last_V_U_ack_in_dummy;
wire    regslice_both_pout8_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 recv_reg = 32'd0;
#0 send_reg = 32'd0;
#0 ap_CS_fsm = 2'd1;
end

stream8rto8_control_s_axi #(
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

stream8rto8_regslice_both #(
    .DataWidth( 8 ))
regslice_both_pin8_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(pin8_TDATA),
    .vld_in(pin8_TVALID),
    .ack_in(regslice_both_pin8_U_ack_in),
    .data_out(pin8_TDATA_int_regslice),
    .vld_out(pin8_TVALID_int_regslice),
    .ack_out(pin8_TREADY_int_regslice),
    .apdone_blk(regslice_both_pin8_U_apdone_blk)
);

stream8rto8_regslice_both #(
    .DataWidth( 8 ))
regslice_both_pout8_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(pin8_TDATA_int_regslice),
    .vld_in(pout8_TVALID_int_regslice),
    .ack_in(pout8_TREADY_int_regslice),
    .data_out(pout8_TDATA),
    .vld_out(regslice_both_pout8_V_data_V_U_vld_out),
    .ack_out(pout8_TREADY),
    .apdone_blk(regslice_both_pout8_V_data_V_U_apdone_blk)
);

stream8rto8_regslice_both #(
    .DataWidth( 1 ))
regslice_both_pout8_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(1'd1),
    .vld_in(pout8_TVALID_int_regslice),
    .ack_in(regslice_both_pout8_V_keep_V_U_ack_in_dummy),
    .data_out(pout8_TKEEP),
    .vld_out(regslice_both_pout8_V_keep_V_U_vld_out),
    .ack_out(pout8_TREADY),
    .apdone_blk(regslice_both_pout8_V_keep_V_U_apdone_blk)
);

stream8rto8_regslice_both #(
    .DataWidth( 1 ))
regslice_both_pout8_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(1'd1),
    .vld_in(pout8_TVALID_int_regslice),
    .ack_in(regslice_both_pout8_V_strb_V_U_ack_in_dummy),
    .data_out(pout8_TSTRB),
    .vld_out(regslice_both_pout8_V_strb_V_U_vld_out),
    .ack_out(pout8_TREADY),
    .apdone_blk(regslice_both_pout8_V_strb_V_U_apdone_blk)
);

stream8rto8_regslice_both #(
    .DataWidth( 1 ))
regslice_both_pout8_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(1'd1),
    .vld_in(pout8_TVALID_int_regslice),
    .ack_in(regslice_both_pout8_V_last_V_U_ack_in_dummy),
    .data_out(pout8_TLAST),
    .vld_out(regslice_both_pout8_V_last_V_U_vld_out),
    .ack_out(pout8_TREADY),
    .apdone_blk(regslice_both_pout8_V_last_V_U_apdone_blk)
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
        p_vld_reg_138 <= pin8_read_nbread_fu_56_p2_0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (pin8_read_nbread_fu_56_p2_0 == 1'd1))) begin
        recv_reg <= add_ln13_fu_108_p2;
        send_reg <= add_ln20_fu_125_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | (regslice_both_pout8_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_138 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (pin8_TVALID_int_regslice == 1'b1))) begin
        pin8_TREADY_int_regslice = 1'b1;
    end else begin
        pin8_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & (p_vld_reg_138 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (pin8_read_nbread_fu_56_p2_0 == 1'd1)))) begin
        pout8_TDATA_blk_n = pout8_TREADY_int_regslice;
    end else begin
        pout8_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (pin8_read_nbread_fu_56_p2_0 == 1'd1))) begin
        pout8_TVALID_int_regslice = 1'b1;
    end else begin
        pout8_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (pin8_read_nbread_fu_56_p2_0 == 1'd1))) begin
        recv_ap_vld = 1'b1;
    end else begin
        recv_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1) & (pin8_read_nbread_fu_56_p2_0 == 1'd1))) begin
        send_ap_vld = 1'b1;
    end else begin
        send_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b1 == ap_block_state1_io) | ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | (regslice_both_pout8_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_138 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign add_ln13_fu_108_p2 = (recv_reg + 32'd1);

assign add_ln20_fu_125_p2 = (send_reg + 32'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state1_io = ((pin8_read_nbread_fu_56_p2_0 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((regslice_both_pout8_V_data_V_U_apdone_blk == 1'b1) | ((p_vld_reg_138 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = ((p_vld_reg_138 == 1'd1) & (pout8_TREADY_int_regslice == 1'b0));
end

assign ap_local_block = 1'b0;

assign ap_local_deadlock = 1'd0;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign pin8_TREADY = regslice_both_pin8_U_ack_in;

assign pin8_read_nbread_fu_56_p2_0 = pin8_TVALID_int_regslice;

assign pout8_TVALID = regslice_both_pout8_V_data_V_U_vld_out;

assign recv = (recv_reg + 32'd1);

assign send = (send_reg + 32'd1);

endmodule //stream8rto8
