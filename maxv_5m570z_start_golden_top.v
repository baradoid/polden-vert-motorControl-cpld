/* maxv_5m570z_start_golden_top.v
 This is a top level wrapper file that instanciates the
 golden top project
 */
 
 module maxv_5m570z_start_golden_top(
 
input   CLK_SE_AR,

// GPIO
input USER_PB0, USER_PB1,
input CAP_PB_1,
output reg USER_LED0, USER_LED1,

// Connector A 
output   [  36: 5] 	AGPIO,

input		AGPIO_1_SCK,
input		AGPIO_2_MOSI,
output 	AGPIO_3_MISO,
input		AGPIO_4_SSEL,

// Connector B
input   [  36: 7] 	BGPIO,
input 	BGPIO_P_1, BGPIO_N_1,
input 	BGPIO_P_2, BGPIO_N_2,
input 	BGPIO_P_3, BGPIO_N_3,

// Motor 1
input MOTOR_1_FB_A, MOTOR_1_FB_B, MOTOR_1_CTRL,
input   [  5: 0] 	MAX_MOTOR_1, 

// Motor 2
input MOTOR_2_FB_A, MOTOR_2_FB_B, MOTOR_2_CTRL,
input   [  5: 0] 	MAX_MOTOR_2, 

// Speaker
input   [  7: 0] 	MAX_SPK, 

// I2C EEPROM
input I2C_PROM_SCL, I2C_PROM_SDA, 
 
// SPI EEPROM
input SPI_MOSI, SPI_SCK, SPI_CSN, SPI_MISO
 );  

 
//parameter uartIdle = 0; 
//parameter recvNum = 1;
//parameter recvPos = 2;

//reg [2:0] uartState = uartIdle;

//wire uartRxDataReady;
//wire [7:0] uartRxData;

//reg [17:0] counter = 0; always @(posedge CLK_SE_AR) counter <= counter + 1;
//wire clock_4ms = (counter== 12'hfff);

//wire clock_1_5mks = (counter[3:0]== 4'hf);
//wire clock_6ms = (counter== 18'hffff);

//wire clock_26ms = (counter== 18'h3ffff);


//assign AGPIO[34] = clock_26ms;

// async_receiver #(.ClkFrequency(10000000), .Baud(230400)) RX(.clk(CLK_SE_AR),
//																				 //.BitTick(uartTick1),
//																				 .RxD(BGPIO[36]), 
//																				 .RxD_data_ready(uartRxDataReady), 
//																				 .RxD_data(uartRxData));
																					
 
//reg [23:0] newPos;
//reg [3:0] posNum;
//reg [11:0] newPosSignal ;
//reg sign = 0;
////assign AGPIO[34] = sign;
//always @(posedge CLK_SE_AR) begin
//
//		
//		if(uartRxDataReady) begin
//			case(uartState)
//				uartIdle: begin				
//					if(uartRxData == "S") begin
//						uartState <= recvNum;	
//						newPosSignal[0] <=1'b1;	
//						sign <=1'b1;
//						USER_LED0 <= 1'b0;						
//					end
//					else begin
//						USER_LED0 <= 1'b1;						
//					end	
//					
//				end			
//				recvNum: begin
//					posNum <= uartRxData;
//					uartState <= recvPos;	
//					newPosSignal[posNum] <=1'b0;
//					sign <=1'b0;	
//					uartState <= uartIdle;
//					USER_LED0 <= 1'b1;	
//										
//				end
//				recvPos: begin
//					newPos <= uartRxData;
//					newPosSignal[posNum] <=1'b1;
//					uartState <= uartIdle;
//				end
//			
//			endcase
//		end
//		else begin
//			newPosSignal[0] <=1'b0;	
//		end
//
//end
reg posReset = 0;
//assign USER_LED0 = stepClockEna[0];
//assign USER_LED1 = stepClockEna[1];
wire [19:0] curPosition[9:0];
reg [12:0] divider[9:0];
//reg moveDirInverse;
reg [9:0] stepClockEna;
reg [9:0] moveDir;
motorCtrlSimple mr00(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[0]), .moveDir(moveDir[0]), .stepClockEna(stepClockEna[0]), .dir(AGPIO[35]), .step(AGPIO[36]), .cur_position(curPosition[0]));
motorCtrlSimple mr01(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[1]), .moveDir(moveDir[1]), .stepClockEna(stepClockEna[1]), .dir(AGPIO[29]), .step(AGPIO[30]), .cur_position(curPosition[1]));
motorCtrlSimple mr02(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[2]), .moveDir(moveDir[2]), .stepClockEna(stepClockEna[2]), .dir(AGPIO[27]), .step(AGPIO[28]), .cur_position(curPosition[2]));
motorCtrlSimple mr03(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[3]), .moveDir(moveDir[3]), .stepClockEna(stepClockEna[3]), .dir(AGPIO[25]), .step(AGPIO[26]), .cur_position(curPosition[3]));
motorCtrlSimple mr04(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[4]), .moveDir(moveDir[4]), .stepClockEna(stepClockEna[4]), .dir(AGPIO[23]), .step(AGPIO[24]), .cur_position(curPosition[4]));
motorCtrlSimple mr05(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[5]), .moveDir(moveDir[5]), .stepClockEna(stepClockEna[5]), .dir(AGPIO[21]), .step(AGPIO[22]), .cur_position(curPosition[5]));
motorCtrlSimple mr06(.CLK(CLK_SE_AR), .reset(posReset), .divider(divider[6]), .moveDir(moveDir[6]), .stepClockEna(stepClockEna[6]), .dir(AGPIO[19]), .step(AGPIO[20]), .cur_position(curPosition[6]));
//motorCtrlSimple mr07(.CLK(CLK_SE_AR), .reset(USER_PB0), .divider(divider[7]), .moveDir(moveDir[7]), .stepClockEna(stepClockEna[7]), .dir(AGPIO[17]), .step(AGPIO[18]), .cur_position(curPosition[7]));
//motorCtrlSimple mr08(.CLK(CLK_SE_AR), .reset(USER_PB0), .divider(divider[8]), .moveDir(moveDir[8]), .stepClockEna(stepClockEna[8]), .dir(AGPIO[15]), .step(AGPIO[16]), .cur_position(curPosition[8]));
//motorCtrlSimple mr09(.CLK(CLK_SE_AR), .reset(USER_PB0), .divider(divider[9]), .moveDir(moveDir[9]), .stepClockEna(stepClockEna[9]), .dir(AGPIO[13]), .step(AGPIO[14]), .cur_position(curPosition[9]));
//motorCtrlSimple mr10(.CLK_50MHZ(CLK_SE_AR), .reset(USER_PB0), .divider(divider[9]), .moveDir(moveDir[9]), .stepClockEna(stepClockEna[9]), .dir(AGPIO[11]), .step(AGPIO[12]), .cur_position(curPosition[9]));

wire [15:0] SSPrecvdData;
wire newWordRecvd;
reg newWordRecvdR;  always @(posedge CLK_SE_AR) newWordRecvdR <= newWordRecvd;
wire newWordRecvd_risingedge = ((newWordRecvdR==1'b0)&&(newWordRecvd==1'b1));  
wire newWordRecvd_fallingedge = ((newWordRecvdR==1'b1)&&(newWordRecvd==1'b0));  

wire [15:0] dataToTransfer = curPosition[0][19:4];
//reg  [15:0] dataToTransfer;
reg AGPIO_4_SSELR;  always @(posedge CLK_SE_AR) AGPIO_4_SSELR <= AGPIO_4_SSEL;
wire AGPIO_4_SSEL_fallingedge = ((AGPIO_4_SSELR==1'b1)&&(AGPIO_4_SSEL==1'b0)); 
SSP ssp(.clk(CLK_SE_AR), .SCK(AGPIO_1_SCK), .MOSI(AGPIO_2_MOSI), .MISO(AGPIO_3_MISO), .SSEL(AGPIO_4_SSEL), .recvdData(SSPrecvdData), .word_received(newWordRecvd), .wordDataToSend(dataToTransfer), .SCK_risingedgeDeb(AGPIO[7]));

parameter wait_cmd_state = 0;
parameter sendCurrentPosition_state = 0;

//reg [3:0] state = wait_cmd_state;
reg [3:0] motorNum;

reg [9:0] lowerPosSignal;
assign AGPIO[5] = newWordRecvd;

reg sendAnsState = 0;
always @(posedge CLK_SE_AR) begin

	if(newWordRecvd_risingedge && (SSPrecvdData[15]== 1'b0)) begin	
		motorNum <= SSPrecvdData[3:0];
		//dataToTransfer[15:0] <= 16'h1111;//curPosition[0][18:3];
	end	
	else if(newWordRecvd_fallingedge && (SSPrecvdData[15]== 1'b0)) begin	
		moveDir[0] <=  SSPrecvdData[4];	
		posReset <=   SSPrecvdData[5];	
		//dataToTransfer <= 16'hbbbb;
		sendAnsState<= 0;		
	end	
	else if(newWordRecvd_fallingedge && (SSPrecvdData[15]== 1'b1)) begin				
		divider[0] <= SSPrecvdData[12:0];
		stepClockEna[0] <= SSPrecvdData[13];								
		//dataToTransfer <= 16'haaaa;
		//state <= wait_cmd_state;		
		sendAnsState<= 1;
	end	
		
//	if(AGPIO_4_SSEL_fallingedge ) begin	
//	 if((sendAnsState== 1'b0)) begin
//			dataToTransfer <= 16'hbbbb;
//	 end
//	 if((sendAnsState== 1'b1)) begin
//			dataToTransfer <= 16'haaaa;
//	  end
//	end	
	
	//dataToTransfer[15:0] <= curPosition[0][18:3];//lowerPosSignal[9:0];
	
	//if(newWordRecvd_fallingedge && (SSPrecvdData[15]== 1'b1)) begin	
		
	//end
	
	USER_LED1 <= USER_PB0; 			
	USER_LED0 <= AGPIO_4_SSEL;
	//USER_LED1 <= moveDir[0];

//	case(state) 
//		wait_cmd_state:  begin
//			if(newWordRecvd) begin
//				//motorNum[SSPrecvdData[3:0]] <= SSPrecvdData[13:4];		
//				divider[motorNum] <= SSPrecvdData[13:4];
//				moveDir[motorNum] <=  SSPrecvdData[14];
//				stepClockEna[motorNum] <= SSPrecvdData[15];
//				dataToTransfer[15:0] <=  {lowerPosSignal[motorNum], curPosition[motorNum][18:4]};				
//				state <= wait_cmd_state;				
//			end						
//			else 
//				dataToTransfer[9:0] <=  lowerPosSignal[9:0];						
//		end
//		
//		sendCurrentPosition_state: begin
//			if(newWordRecvd) begin
//				divider[motorNum] <= SSPrecvdData[9:0];
//				dataToTransfer <= {lowerPosSignal[motorNum], curPosition[motorNum][15:0]};
//				state <= wait_cmd_state;
//			end
//				
//		end
//		
//	endcase
end


endmodule

