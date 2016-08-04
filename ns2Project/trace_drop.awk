#$��gwak �Cf drop trace > d


BEGIN {
         #�����ʼ�����趨������¼�����Լ��������İ�����Ŀ
       fsDrops = 0;   #�������İ�����Ŀ
       numfs0 = 0;   #0�ڵ㷢�͵�CBR�������Ŀ
       numfs2 = 0;   #2�ڵ���յ�CBR�������Ŀ
}
{
       event = $1;
       time = $2;
       node_nb = $3;
       trace_type = $4;
       flag = $5;
       uid = $6
       pkt_type = $7;
       pkt_size = $8; 

       node_nb=substr(node_nb,2,1);

       #ͳ�ƽڵ�0���͵�CBR���
       if (node_nb==0 && event== "s" && trace_type== "MAC" && pkt_type== "cbr") 
              numfs0++;
       #ͳ�ƽڵ�2������CBR���
       if (node_nb==2 && event== "r" && trace_type== "MAC" && pkt_type== "cbr") 
              numfs2++;
}

END {
       average=0;   #average���ڼ�¼������
       fsDrops = numfs0-numfs2;    #������Ŀ
       average=fsDrops/numfs0;     #������
       printf("number of packets sent:%d lost_rate:%d\n", numfs0, average);  #��ӡ���ͷ����Ŀ�Ͷ�����
}
