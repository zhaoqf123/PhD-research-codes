% In this program, finite DTQW will be studied,
% In the two ends of the finite QW chain, 
% reflection coins are implemented.
% function []=EigenStatesQW_disorder()

% Here adiabatic means the disorder realization with average angle 
% <\theta>_0 will gradually reduce to average angle 0.
% The wave function when angle=0 will be compared to exact diagonalization
% Or compared to mulitiplication of U to wave function
rng('shuffle'); % select a random seed based on current time.
N=20; % N is the number of sites.
theta0=pi/2; %theta0 is the disorder averaged value.
w=0.70; % w is the width of disorder.
TMP=theta0 + 2*w*(rand(1,N-3)-0.5);
theta2=theta0 + 2*w*(rand-0.5);

hh=3;
N2_st1=hh*30; % N2 is the evolution numbers of QW.
N2_st2=hh*70;
N2=N2_st1+N2_st2; % N2_st1 and N2_st2 are stage 1 and stage 2.
d_th0=theta0/N2;  % d_theta0 is the adiabatic step of rotation angle
d_th2=theta2/N2;
Theta=zeros(N2,N);
Theta(1,3:N-1)=TMP;
contl=N-8;
Prob=zeros(1,N2); % it records the probability of wave remaining 0-state
Gap=zeros(1,N2);

Th1=-pi/2;
ThN=pi/2; % This set of data possess edge states

Vec=zeros(2*N-2,1);
Vec(1)=1/sqrt(2);
Vec(2)=1/sqrt(2); %Vec: The initial wave @ the edges of chain.
Vec2=Vec;
Vec_origin=Vec;



Pemu=ones(1,N2);
Adia=zeros(N2,N);
Pemu_adia=ones(N,1);


for k=1:N2
    Adia(k,1)=-k*d_th0;
end;
Adia=Adia(:,Pemu_adia);
Adia(:,1)=0;
Adia(:,N)=0;
for k=1:N2
    Adia(k,2)=-k*d_th2;
end;

Theta(1,2)=ThN; % This is to make sure initial state is exacltly 0 state
Theta(1,1)=Th1;
Theta(1,N)=ThN;

Corr=zeros(1,N-1); % It stores all the correlations w.r.t. position 0;
corr_tmp=zeros(1,N-1);

Vec=Vec_origin; % Initialize the initial wave function

% above 4 creats 1st row of the Theta matrix
%    Theta=Theta(Pemu,:); % It copys the 1st row to all other row

Angle=Theta(Pemu,:)+Adia;
C_theta=cos(Angle);
S_theta=sin(Angle);
for j=1:N2
    k=1;
    Vec2(2*k-1)=S_theta(j,k+1)*Vec(2*k)+C_theta(j,k+1)*Vec(2*k+1);
    Vec2(2*k)=-S_theta(j,k)*Vec(2*k-1); % +C_theta(j,k)*Vec(2*k-2);
    for k=2:(N-2)
        Vec2(2*k-1)=S_theta(j,k+1)*Vec(2*k)+C_theta(j,k+1)*Vec(2*k+1);
        Vec2(2*k)=-S_theta(j,k)*Vec(2*k-1) +C_theta(j,k)*Vec(2*k-2);
    end;
    k=N-1;
    Vec2(2*k-1)=S_theta(j,k+1)*Vec(2*k);%+C_theta(j,k+1)*Vec(2*k+1);
    Vec2(2*k)=-S_theta(j,k)*Vec(2*k-1) +C_theta(j,k)*Vec(2*k-2);
    Vec=Vec2;
    
    ThetaU=Angle(j,:);
    U=zeros(2*N,2*N);
    for k=1:N-1
        U(2*k+1,2*k-1)=cos(ThetaU(k));
        U(2*k+1,2*k)=-sin(ThetaU(k));

        U(2*k,2*k+1)=sin(ThetaU(k+1));
        U(2*k,2*k+2)=cos(ThetaU(k+1));
    end;
    U(1,:)=[];
    U(:,1)=[];
    U(2*N-1,:)=[];
    U(:,2*N-1)=[];

    [V, D]=eig(U);
    [DD,IX]=sort(angle(diag(D)));
    V2=V(:,IX);

    % figure(1);
    % plot(DD,'r.');
    % 
    % % V_diff=V2(:,N-1)-Vec;
    % % figure(2);
    % % plot(abs(V_diff),'b.');
    % V_diff=abs(V2(:,N-1))-abs(Vec);
    % figure(2);
    % plot(V_diff,'b.');
    Vec10=abs(Vec'*V2).^2;
    Prob(j)=Vec10(N-1);
    Gap(j)=DD(N)-DD(N-1);    
%     figure(hh-1);
%     clf;
%     plot(abs(Vec'*V2),'g.');
%     
%     
%     figure(hh);
%     clf;
%     plot(abs(V2(:,N-1)),'k.');
%     hold on;
%     plot(abs(Vec),'r.');
%     j
%     mean(Angle(j,2:N-1))
%     
%     figure(hh+1);
%     clf;
%     plot(DD,'b.');
%     pause;
end;
clr=[rand,rand,rand];
figure(hh+5);
hold on;
plot(Prob,'.','Color',clr,'DisplayName',['N2=' int2str(N2)]);
legend(gca,'show');


figure(hh+7);
hold on;
plot(Gap,'.','Color',clr,'DisplayName',['N2=' int2str(N2)]);
legend(gca,'show');