%% ���ⶨ��tempPSNR2�����壬����Ϊ֮ǰFSR_ADMM������������tempPSNR���棬����һ�£��ŵ�tempPSNR2����ĵ�һ��
clc
clear
close all
% figure;
% text(.5, .5,'hello, i''m qwe');
% axis off;
% orient tall;
% print(gcf,'-r300','-dpdf','a.pdf');
tempPSNR=zeros(800,5);%ר�����ADMM��ֻ�е�һ������
% tempPSNR2=zeros(800,5);%ר�����SADMM����һ������,���0.1����0.4-0.7
% tempPSNR3=zeros(800,5);%ר�����SADMM����һ������,���0.2
% tempPSNR4=zeros(800,5);%ר�����SADMM����һ������,���0.1,��0.7-1
tempPSNR5=zeros(800,3);%ר�����SADMM��,���0.2,��0.1-0.5
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
        %% 20160422�������alpha�����ˣ�������loading y������ġ�
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
 

