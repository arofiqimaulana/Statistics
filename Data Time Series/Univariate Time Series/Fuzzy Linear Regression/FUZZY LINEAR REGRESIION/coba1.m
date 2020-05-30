function [angin1,angin2,angou,memdeg,rulejadi,k]=golekrule(Yt1,Yt2,Yt)
format short;
n=length(Yt); 

Yt11=trimf(Yt1,[14.05 20.2 26.35]);
Yt12=trimf(Yt1,[20.2 26.35 32.5]);
Yt13=trimf(Yt1,[26.35 32.5 38.65]);

msinput1=[Yt11 Yt12 Yt13];
mem1=zeros(n,1); 
ket1=zeros(n,1); 

for i=1:n 
 mem1(i)=max(msinput1(i,:)); 
 if max(msinput1(i,:))==msinput1(i,1);
  ket1(i)=1;
  elseif max(msinput1(i,:))==msinput1(i,2);
   ket1(i)=2;
   else max(msinput1(i,:))==msinput1(i,3);
    ket1(i)=3;
 end
end

angin1=[ket1 mem1];


Yt21=gaussmf(Yt2,[0.9801 20.2]); 
Yt22=gaussmf(Yt2,[0.9801 26.35]);
Yt23=gaussmf(Yt2,[0.9801 32.5]);

msinput2=[Yt21 Yt22 Yt23]; 
mem2=zeros(n,1); 
ket2=zeros(n,1); 

for i=1:n 
 mem2(i)=max(msinput2(i,:)); 
 if max(msinput2(i,:))==msinput2(i,1);
  ket2(i)=1;
  elseif max(msinput2(i,:))==msinput2(i,2);
   ket2(i)=2;
   elseif max(msinput2(i,:))==msinput2(i,3);
    ket2(i)=3;
  end
end

angin2=[ket2 mem2];


Yt01=trapmf(Yt,[14.66 19.59 20.81 25.73]);
Yt02=trapmf(Yt,[20.8 25.7 27 31.9]);
Yt03=trapmf(Yt,[26.97 31.88 33.12 38.03]);


msoutput=[Yt01 Yt02 Yt03 ]; 
memou=zeros(n,1); 
ketou=zeros(n,1); 

for i=1:n 
 memou(i)=max(msoutput(i,:)); 
 if max(msoutput(i,:))==msoutput(i,1);
  ketou(i)=1;
  elseif max(msoutput(i,:))==msoutput(i,2);
   ketou(i)=2;
   elseif max(msoutput(i,:))==msoutput(i,3);
    ketou(i)=3;
 end
end

angou=[ketou memou];

member=[ket1 ket2 ketou]; 


rdeg=zeros(n,1); 
for i=1:n
 rdeg(i)=mem1(i)*mem2(i)*memou(i); 
end

%seleksi rule
memdeg=[member rdeg]; %rule beserta rule degree
rule=member;%inisialisasi rule
%proses seleksi rule, looping membandingkan antar baris
for i=1:(n-1)
 for j=(i+1):n
   if (member(i,1)==member(j,1))&(member(i,2)==member(j,2))&(member(i,3)~=member(j,3)) %kondisi jika input sama output beda
    if (max(rdeg(i),rdeg(j))==rdeg(i)) %membandingkan maksimum rule degree yg tidak maks di nolkan
     rule(j,:)=0;
    elseif (max(rdeg(i),rdeg(j))==rdeg(j))
     rule(i,:)=0;
    end
   elseif (member(i,1)==member(j,1))&(member(i,2)==member(j,2))&(member(i,3)==member(j,3)) %kondisi jika input output sama utk beberapa
    if (max(rdeg(i),rdeg(j))==rdeg(i)) %yang tidak maks di nolkan
     rule(j,:)=0;
    elseif (max(rdeg(i),rdeg(j))==rdeg(j))
     rule(i,:)=0;
      end
     end
   end
  end


%menghitung banyaknya rule yang terbentuk
k=0;
for i=1:n
 if rule(i,:)~=[0 0 0]
  k=k+1;
 end
end

%menampilkan ringkasan rule yang terbentuk
rulejadi=[0 0 0 0];
for i=1:n
 if rule(i,:)~=[0 0 0]
 rulejadi=[rulejadi;rule(i,:) rdeg(i)];
 end
end
rulejadi=rulejadi((2:end),:);

end
%peramalan
fuz=readfis('coba1');
in=[Yt1 Yt2];
out=evalfis(in,fuz);
ts1=timeseries(Yt,1:94);
ts2=timeseries(out,1:94);
plot(ts1,'.-b');
hold on
plot(ts2,'s-m','Markersize',6);
xlabel('Time');
ylabel('Observed');
title('Actual vs. Predict');
legend('Actual','Predict');
%%Meode min
%%rule 1
Input11=trimf(Yt1,[26.35 32.5 38.65]);
Input21=gaussmf(Yt2,[0.9801 32.5]);
MinInput1=min(Input11,Input21);
%%rule 2
Input12=trimf(Yt1,[20.2 26.35 32.5]);
Input22=gaussmf(Yt2,[0.9801 32.5]);
MinInput2=min(Input12,Input22);
%%rule 3
Input13=trimf(Yt1,[20.2 26.35 32.5]);
Input23=gaussmf(Yt2,[0.9801 20.2]); 
MinInput3=min(Input13,Input23);
%%rule 4
Input14=trimf(Yt1,[14.05 20.2 26.35]);
Input24=gaussmf(Yt2,[0.9801 20.2]); 
MinInput4=min(Input14,Input24);
%%rule 5
Input15=trimf(Yt1,[20.2 26.35 32.5]);
Input25=gaussmf(Yt2,[0.9801 26.35]);
MinInput5=min(Input15,Input25);
%%rule 6
Input16=trimf(Yt1,[26.35 32.5 38.65]);
Input26=gaussmf(Yt2,[0.9801 26.35]);
MinInput6=min(Input16,Input26);
%%rule 7
Input17=trimf(Yt1,[14.05 20.2 26.35]);
Input27=gaussmf(Yt2,[0.9801 26.35]);
MinInput7=min(Input17,Input27);

InputFix=[MinInput1 MinInput2 MinInput3 MinInput4 MinInput5 MinInput6 MinInput7];

%%rule 1
Input11=trimf(Yt1,[26.35 32.5 38.65]);
Input21=gaussmf(Yt2,[0.9801 32.5]);
MaxInput1=max(Input11,Input21);
%%rule 2
Input12=trimf(Yt1,[20.2 26.35 32.5]);
Input22=gaussmf(Yt2,[0.9801 32.5]);
MaxInput2=max(Input12,Input22);
%%rule 3
Input13=trimf(Yt1,[20.2 26.35 32.5]);
Input23=gaussmf(Yt2,[0.9801 20.2]); 
MaxInput3=max(Input13,Input23);
%%rule 4
Input14=trimf(Yt1,[14.05 20.2 26.35]);
Input24=gaussmf(Yt2,[0.9801 20.2]); 
MaxInput4=max(Input14,Input24);
%%rule 5
Input15=trimf(Yt1,[20.2 26.35 32.5]);
Input25=gaussmf(Yt2,[0.9801 26.35]);
MaxInput5=max(Input15,Input25);
%%rule 6
Input16=trimf(Yt1,[26.35 32.5 38.65]);
Input26=gaussmf(Yt2,[0.9801 26.35]);
MaxInput6=max(Input16,Input26);
%%rule 7
Input17=trimf(Yt1,[14.05 20.2 26.35]);
Input27=gaussmf(Yt2,[0.9801 26.35]);
MaxInput7=max(Input17,Input27);

Jumlah=MaxInput1+MaxInput2+MaxInput3+MaxInput4+MaxInput5+MaxInput6+MaxInput7+MaxInput8+MaxInput9;
InputFix=[MaxInput1 MaxInput2 MaxInput3 MaxInput4 MaxInput5 MaxInput6 MaxInput7];