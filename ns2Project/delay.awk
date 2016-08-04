# ʹ�õ�������trace�ľɸ�ʽ
BEGIN {
     highest_packet_id = 0;
} 
{
   action = $1;
   time = $2;
   packet_id = $6;
   type = $7;
   
# ������·�ɰ������Ա�֤���Ϊ0��cbr��ͳ�Ƶ�
   if ( type == "cbr" ) {
   
   if ( packet_id > highest_packet_id )
	 highest_packet_id = packet_id;
 
#��¼����Ĵ���ʱ��
   if ( start_time[packet_id] == 0 )  
	start_time[packet_id] = time;
 
#��¼CBR �Ľ���ʱ��
   if (  action != "D" ) {
      if ( action == "r" ) {
         end_time[packet_id] = time;
      }
   } else {
#�Ѳ��������������ݰ���ʱ����Ϊ-1
      end_time[packet_id] = -1;
   }
}	
}						  
END {
#��������ȫ����ȡ��󣬿�ʼ������Ч����Ķ˵㵽�˵��ӳ�ʱ�� 
    for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) {
       start = start_time[packet_id];
       end = end_time[packet_id];
       packet_duration = end - start;
 
#ֻ�ѽ���ʱ����ڴ���ʱ��ļ�¼�г���
       if ( start < end ) printf("%f %f\n", start, packet_duration);
   }
}