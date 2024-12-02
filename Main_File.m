% clear all
% clc
syms lm mu al d b et th sv s R T sig
 lm=3.12%2.5:0.1:4;%:.1:4.5      %%% arrival rate
% 
mu=6.5%4.5:0.1:6.5%4.5%:0.1:6.5%%% service rate in busy mode
alm=4
%nu=0.0:0.1:1
  al=5.6%.5:0.1:2  %%% retrial rate
  %al=alm.*nu %% retrail modified multiply by sigma
  d=.7        %%% Disaster rate
% % d=0.3:0.1:1
  b=1.5%1:.1:2.5       %%% Repair rate
%       %%% service rate in WV
 et=5%
  th=0.5%:.1:2%1.3       %%% Vcation interruption time
  sv=.8      %%% balking probbaility in WV
  s=0.3%:.1:1         %%% balking probability in Busy mode
%[mu et]= meshgrid (mu, et)
R=5:0.1:15
T=1
x1=((((lm.*s+d).*(lm+al))+mu.*al)-sqrt(((((lm.*s+d).*(lm+al))+mu.*al).^2)-(4.*al.*mu.*lm.*s.*(lm+al))))./(2.*al.*mu) %%% root from P(n,3)
C=((lm.*sv)./((lm.*sv+et+th))) %%%% iterative on P(n,1)
K=-((((lm.*et)+(al.*C.*et)+(th.*((lm+al)))).*(C.^2))./((al.*mu.*(C.^2))-((((lm.*s+d).*(lm+al))+mu.*al).*C)+(lm.*s.*(lm+al))))%%%% special solution from non-homogeneous differential equation
M=(((mu.*(1-x1))+d).*(1-C))./((1-x1).*((((lm.*sv)-(et.*C)-(mu.*K)).*(1-C))-d.*K)) %%%%%% Find P(0,0) from this we denote the term
d1=((M./(1-C))+(((mu.*x1.*(1-C))+(M.*C.*(mu.*K+C.*et).*(1-x1)))./((lm+al).*(1-x1).*(1-C)))+((b+d).*(((1-C)+(K.*M.*(1-x1)))))./(b*(1-x1).*(1-C))).^(-1)%%%%% parameter from P(n,3)
P0=M.*d1 %%% probability P(0,0)
P1=M.*(C./(1-C)).*d1 %%% probability P(n,1)
P2=(((mu.*x1.*(1-C))+(M.*C.*(mu.*K+C.*et).*(1-x1)))./((lm+al).*(1-x1).*(1-C))).*d1 %%% probability P(n,2)
P3=((1./(1-x1))+((K.*M)./(1-C))).*d1 %%% probability P(n,3)
PF=(d./b).*((1./(1-x1))+((K.*M)./(1-C))).*d1 %%% probability PF disaster
DR=d.*P3; %%%% Disaster rate in the system
LS=((M.*((C.^2)./((1-C).^2)))+(((mu.*(x1).*((1-C).^2))+(M.*C.*(mu.*K+C.*et).*((1-x1).^2)))./((lm+al).*((1-x1).^2).*((1-C).^2)))+((x1./((1-x1).^2))+((K.*M.*C)./((1-C).^2)))+((d./b).*((x1./((1-x1).^2))+((K.*M.*C)./((1-C).^2))))).*d1; %% Expectd number of customer in the system
LmE=lm.*s.*(P2+P3)+lm.*sv.*P1; %% effective arrival rate  
WS=LS./(LmE)
WQ=WS-(1./(mu+et))
TH=(mu.*P3)+(et.*P1)
TC=70.*LS+10.*P0+35.*P1+25.*P2+50.*P3+25.*mu+10.*et; %%% Cost function
SOC=LmE.*R-T.*LS
%SS=TC.'
%writematrix(SS,'Y.xlsx','sheet',1)
% EN1=C./(1-C) %%% Average length for server is in working vacation
% EN3=(x1.*((1-C).^2)+(K.*M.*C.*((1-x1).^2)))./(((K.*M.*(1-x1))+1-C).*(1-x1).*(1-C))  %%% Average length for server is in normal busy 
%solve(SOC,s)
 plot(mu,SOC)

 hold on 
%surfc(mu,et,TC)
% hold on
 %legend('d=0.3','d=0.5','d=0.7')
 %legend('\alpha=0.5','\alpha=1','\alpha=1.5')
% legend('\beta=0.5','\beta=1','\beta=1.5')
 xlabel('\mu','FontWeight','bold','FontName','Times New Roman');
 ylabel('Social Profit','FontWeight','bold','FontName','Times New Roman');
 legend('q=0.7','q=0.8','q=0.9')

 %zlabel('TC(\mu, \eta)','FontWeight','bold','FontName','Times New Roman')

% S= [P0;
%     P1 ;
%     P2 
%     P3 
%     PF 
%     EN3
%     TC 
%     EN1]'
%     

%TC
