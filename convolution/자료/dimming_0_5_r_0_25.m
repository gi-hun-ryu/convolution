% clear all
% clc
% K=9;
% 
% if K==9
%  Type1 = 367;
%  Type2 = 403;
%  Type3 = 457;
%  Type4 = 349;
% end
% %state길이
% state_num=2^(K-1);
% 
% %이제 codebit 저장할거임
% 
% %codebit_black1/codebit_blue1
% plus1=1;
% plus2=129;
% 
% %이 codebit는 state가 0, 2, 4.......
% for i=1:2:state_num
%     %0을 입력으로한 code_bit black1 이거는 codebit니까 -1 안 해도 ㄱㅊ
%   if mod(sum([0,bitget(bitand(i-1,Type1),1:K-1)]),2)==1
%       code_bit1=1;
%   else
%       code_bit1=0;
%   end
% 
%   if mod(sum([0,bitget(bitand(i-1,Type2),1:K-1)]),2)==1
%       code_bit2=1;
%   else
%       code_bit2=0;
%   end
% 
%    if mod(sum([0,bitget(bitand(i-1,Type3),1:K-1)]),2)==1
%       code_bit3=1;
%   else
%       code_bit3=0;
%    end
% 
%    if mod(sum([0,bitget(bitand(i-1,Type4),1:K-1)]),2)==1
%       code_bit4=1;
%   else
%       code_bit4=0;
%    end
% 
%    code_bit=[code_bit1,code_bit2,code_bit3,code_bit4];
% 
%    codebit_black1(plus1,2)=bin2dec(num2str(code_bit));
% 
%    plus1=plus1+1;
% 
%    %1을 입력으로한 code_bit blue1 이거는 codebit니까 -1 안 해도 ㄱㅊ
%   if mod(sum([1,bitget(bitand(i-1,Type1),1:K-1)]),2)==1
%       code_bit1=1;
%   else
%       code_bit1=0;
%   end
% 
%   if mod(sum([1,bitget(bitand(i-1,Type2),1:K-1)]),2)==1
%       code_bit2=1;
%   else
%       code_bit2=0;
%   end
% 
%    if mod(sum([1,bitget(bitand(i-1,Type3),1:K-1)]),2)==1
%       code_bit3=1;
%   else
%       code_bit3=0;
%    end
% 
%    if mod(sum([1,bitget(bitand(i-1,Type4),1:K-1)]),2)==1
%       code_bit4=1;
%   else
%       code_bit4=0;
%    end
% 
%    code_bit=[code_bit1,code_bit2,code_bit3,code_bit4];
% 
%    codebit_blue1(plus2,2)=bin2dec(num2str(code_bit));
% 
%    plus2=plus2+1;
% end
% 
% 
% %codebit_black2/codebit_blue2
% plus1=1;
% plus2=129;
% 
% %이 codebit는 state가 1, 3, 5.......
% for i=2:2:state_num
% %0을 입력으로한 code_bit black2 이거는 codebit니까 -1 안 해도 ㄱㅊ
%   if mod(sum([0,bitget(bitand(i-1,Type1),1:K-1)]),2)==1
%       code_bit1=1;
%   else
%       code_bit1=0;
%   end
% 
%   if mod(sum([0,bitget(bitand(i-1,Type2),1:K-1)]),2)==1
%       code_bit2=1;
%   else
%       code_bit2=0;
%   end
% 
%    if mod(sum([0,bitget(bitand(i-1,Type3),1:K-1)]),2)==1
%       code_bit3=1;
%   else
%       code_bit3=0;
%    end
% 
%    if mod(sum([0,bitget(bitand(i-1,Type4),1:K-1)]),2)==1
%       code_bit4=1;
%   else
%       code_bit4=0;
%    end
% 
%    code_bit=[code_bit1,code_bit2,code_bit3,code_bit4];
% 
%    codebit_black2(plus1,2)=bin2dec(num2str(code_bit));
% 
%    plus1=plus1+1;
% 
%    %1을 입력으로한 code_bit blue2 이거는 codebit니까 -1 안 해도 ㄱㅊ
%   if mod(sum([1,bitget(bitand(i-1,Type1),1:K-1)]),2)==1
%      code_bit1=1;
%   else
%       code_bit1=0;
%   end
% 
%   if mod(sum([1,bitget(bitand(i-1,Type2),1:K-1)]),2)==1
%       code_bit2=1;
%   else
%       code_bit2=0;
%   end
% 
%    if mod(sum([1,bitget(bitand(i-1,Type3),1:K-1)]),2)==1
%       code_bit3=1;
%   else
%       code_bit3=0;
%    end
% 
%    if mod(sum([1,bitget(bitand(i-1,Type4),1:K-1)]),2)==1
%       code_bit4=1;
%   else
%       code_bit4=0;
%    end
% 
%    code_bit=[code_bit1,code_bit2,code_bit3,code_bit4];
% 
% 
%    codebit_blue2(plus2,2)=bin2dec(num2str(code_bit));
% 
%    plus2=plus2+1;
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%반복시작
% lastcount=0;
% whilecount=0;
% %plot 위해서5
% 
% DBB= input('몇 dB까지 구하시겠습니까?:');
% 
% 
% for DB=6:1:DBB
% while(1)
%     tic
%      whilecount=whilecount+1;
% %이제 input
% my_input=randi([0,1],1,200);
% en_output=[];
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%인코더
% register_state=zeros(1,K-1);
% 
% for i=1:length(my_input)
% 
% current_input=my_input(i);
% 
% en_output=gg(K,current_input,register_state,en_output);
% 
% register_state=[current_input,register_state(1:K-2)];
% 
% end
% 
% %레지스터 업데이트 & tail bit
% for i=1:(K-1)
%     current_input=0;
% 
%     en_output=gg(K,current_input,register_state,en_output);
% 
%     register_state=[current_input,register_state(1:K-2)];
% 
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%여기까지 
% 
% %인코딩 완료
% input=en_output;
% 
% %state길이
% state_num=2^(K-1);
% 
% %soft
% input(input==0)=-1;
% r=length(my_input)/length(input);
% db=10^(DB/20);
% sigma=(1/sqrt(r))*(1/db);
% noise=normrnd(0,sigma,[1,length(input)]);
% input=input+2*noise;
% 
% %쓰레기값 입력
% count(2:state_num,1)=-1000000;
% 
% %black_count,blue_count 1,2계산
% black_count1=zeros(state_num,(length(input)/4)+1);
% black_count2=zeros(state_num,(length(input)/4)+1);
% blue_count1=zeros(state_num,(length(input)/4)+1);
% blue_count2=zeros(state_num,(length(input)/4)+1);
% 
% for j=2:(length(input)/4)+1
% 
%  %black_count1,2계산
%  plus=1;
% for i=1:128
%     for yebin=1:4
%     black_count1(plus,j)= black_count1(plus,j)+input(4*j-(7-(yebin-1)))*(2*(bitget(codebit_black1(plus,2),(4-(yebin-1))))-1);
%     black_count2(plus,j)= black_count2(plus,j)+input(4*j-(7-(yebin-1)))*(2*(bitget(codebit_black2(plus,2),(4-(yebin-1))))-1);
%     end
%     plus=plus+1;
% end
% 
%  plus=129;
% for i=1:128
%     for yebin=1:4
%     blue_count1(plus,j)= blue_count1(plus,j)+input(4*j-(7-(yebin-1)))*(2*(bitget(codebit_blue1(plus,2),(4-(yebin-1))))-1);
%     blue_count2(plus,j)= blue_count2(plus,j)+input(4*j-(7-(yebin-1)))*(2*(bitget(codebit_blue2(plus,2),(4-(yebin-1))))-1);
%     end
%     plus=plus+1;
% end
% 
% for i=1:state_num/2
% 
%     y=[count(2*i-1,j-1)+black_count1(i,j),count(2*i,j-1)+black_count2(i,j)];
%     count(i,j)=max(y);
% 
%      b=[count(2*i-1,j-1)+blue_count1(i+128,j),count(2*i,j-1)+blue_count2(i+128,j)];
%     count(i+128,j)=max(b);
% 
% end
% 
% end %위 for 2:뭐시기 까지의 end
% 
% %가장 큰 값 구하기
% [max_value, max_index] = max(count(:,(length(input)/4)+1));
% max_index=1;
% output=[];
% %output 구하기
% for i=1:length(input)/4
% 
% if 1<=max_index&&max_index<=128
%     bose=[black_count1(max_index,length(input)/4+1-(i-1))+count(2*max_index-1,length(input)/4-(i-1)),black_count2(max_index,length(input)/4+1-(i-1))+count(2*max_index-1+1,length(input)/4-(i-1))];
%     [bose_value,bose_index]=max(bose);
%     output=[0,output];
%     max_index=2*max_index-1+(bose_index-1);
% else
%     bose=[blue_count1(max_index,length(input)/4+1-(i-1))+count(2*max_index-1-256,length(input)/4-(i-1)),blue_count2(max_index,length(input)/4+1-(i-1))+count(2*max_index-1+1-256,length(input)/4-(i-1))];
%     [bose_value,bose_index]=max(bose);
%     output=[1,output];
%     max_index=2*max_index-1-256+(bose_index-1);
% end
% 
% 
% end
% 
% c1=my_input;
% c2=output(1:end-(K-1));
% different_count = sum(c1 ~= c2);
% lastcount=different_count+lastcount;
% BER=lastcount/(length(my_input)*whilecount);
% fprintf('\n누적 에러개수 : %d\n',lastcount);
% fprintf('반복 횟수 : %d\n',whilecount);
% fprintf('현재db : %f\n',DB);
% fprintf('현재BER : %f\n',BER);
% elapsedTime = toc; % 경과한 시간을 초 단위로 반환
%     disp(['한번 반복시간: ' num2str(elapsedTime) ' seconds']);
% if lastcount>=200&&whilecount>=200
%     break;
% end
% 
% 
% end
% result(1,DB) = BER;
%     BER = 0;
%     lastcount = 0;
%     whilecount = 0;
% 
% 
% end
% 
% 
% %xor하는 함수
% function en_output=gg(k,current_input,register_state,en_output)
% 
% if k==9
% n1=[1 0 1 1 0 1 1 1 1];
% n2=[1 1 0 0 1 0 0 1 1];
% n3=[1 1 1 0 0 1 0 0 1];
% n4=[1 0 1 0 1 1 1 0 1];
% end
% 
% current_input=[current_input,register_state];
% 
% if mod(sum(current_input.*n1),2)==1
%     code_bit1=1;
% else
%     code_bit1=0;
% end
% 
% if mod(sum(current_input.*n2),2)==1
%     code_bit2=1;
% else
%     code_bit2=0;
% end
% 
% if mod(sum(current_input.*n3),2)==1
%     code_bit3=1;
% else
%     code_bit3=0;
% end
% 
% if mod(sum(current_input.*n4),2)==1
%     code_bit4=1;
% else
%     code_bit4=0;
% end
% 
% een_output=[code_bit1,code_bit2,code_bit3,code_bit4];
% 
% en_output=[en_output,een_output];
% end
% 
% %6.25%로 바꿔주는 함수
% function result = transform_een_output(een_output)
% 
%     % een_output을 4비트 이진 배열에서 10진수로 변환 (비트 연산 사용)
%     dec_value = een_output(1) * 8 + een_output(2) * 4 + een_output(3) * 2 + een_output(4);
% 
%     % 1을 15 - dec_value 만큼 왼쪽으로 시프트 (0000일 때는 0번째 비트에 1이 나와야 함)
%     result = bitshift(1, dec_value);
% 
%     % 결과를 16비트 이진 배열로 변환
%     result = bitget(result, 16:-1:1);  % 직접 비트 배열로 변환
% end
% 
% 
% 
% 
% % 
x = [ 6, 7, 8, 9, 10, 11, 12, 13];
%%Y축 값 (BER)
y = [ 0.4191, 0.3231, 0.1875, 0.0626, 0.0103, 7.0629e-04, 3.4104e-05, 8.0269e-07];
%%로그 스케일로 그래프 그리기
semilogy(x, y);
%%그래프 속성 설정
grid on;  % 그리드 추가
xlim([6 15]);  % X축 범위 설정
ylim([1e-7 1]);  % Y축 범위 설정 (로그 스케일에 맞게 설정)