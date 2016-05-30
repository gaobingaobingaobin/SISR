%% 另外定义tempPSNR2的意义，是因为之前FSR_ADMM产生的数据在tempPSNR里面，想用一下，放到tempPSNR2里面的第一列
clc
clear
close all
% figure;
% text(.5, .5,'hello, i''m qwe');
% axis off;
% orient tall;
% print(gcf,'-r300','-dpdf','a.pdf');
tempPSNR=zeros(800,5);%专门针对ADMM，只有第一列有用
% tempPSNR2=zeros(800,5);%专门针对SADMM，第一列无用,间隔0.1，从0.4-0.7
% tempPSNR3=zeros(800,5);%专门针对SADMM，第一列无用,间隔0.2
% tempPSNR4=zeros(800,5);%专门针对SADMM，第一列无用,间隔0.1,从0.7-1
tempPSNR5=zeros(800,3);%专门针对SADMM，,间隔0.2,从0.1-0.5
TV_FSR_PSNRADMMcolor=zeros(800,1);
TV_FSR_PSNRSADMMcolor=zeros(800,1);
for II=1
    ImgNo=II;
    switch ImgNo
        case 1
            OrgName = 'peppers512';
        case 2
            OrgName = 'baboon512';
        case 3
            OrgName = 'Lena512';
        case 4
            OrgName = 'Parrots';
        case 5
            OrgName = 'Monarch';
        case 6
            OrgName = 'Vessels';
        case 7
            OrgName = 'peppers';
    end
    
%     TV_FSR_PSNRADMMcolor=demo_TV_SR_colorADMM2(OrgName);
%     tempPSNR(:,1)=TV_FSR_PSNRADMMcolor;
%     miditer=50;
    load y
    yy=y;
    i=1;
    for alpha=0.5
%         i=i+1;
        %% 20160422问题出现alpha不动了，可能是loading y后引起的。
        TV_FSR_PSNRSADMMcolor=demo_TV_SR_colorSADMM2(OrgName,alpha,yy);       

        tempPSNR5(:,i)=TV_FSR_PSNRSADMMcolor;
        

    end
%     load tempPSNR

end
% load tempPSNR
%  tempPSNR5(:,1)= tempPSNR(:,1);
miditer=100;
    figure(1)
    semilogy(1:miditer,tempPSNR5(1:miditer,1),'m*-');
%     hold on;
%    semilogy(1:miditer,tempPSNR5(1:miditer,2),'rs-');
%     hold on
%     semilogy(1:miditer,tempPSNR5(1:miditer,3),'b*-');
%      hold on;
%    semilogy(1:miditer,tempPSNR5(1:miditer,4),'gs-');
%       hold on;
%    semilogy(1:miditer,tempPSNR5(1:miditer,5),'ks-');
    xlabel('Iteration number');
    ylabel('PSNR(dB)');
    % legend('ADMM','FSR-ADMM','SADMM','FSR-SADMM');
%     legend('FSR-ADMM','FSR-SADMM(0.7)','FSR-SADMM(0.8)','FSR-SADMM(0.9)','FSR-SADMM(1.0)');
%       legend('FSR-SADMM(0.1)','FSR-SADMM(0.2)','FSR-SADMM(0.3)');
    legend('FSR-SADMM0.5');
 

