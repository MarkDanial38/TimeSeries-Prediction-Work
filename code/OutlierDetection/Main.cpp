#include "stdafx.h"  
#include"csvreader.h"
#include "datahandler.h"

int main(int argc, char* argv[]){

	DataHandler handler;
	
	//handler.axisTemperatureFunction();
	
	//string filesPath="F:\\sql_out\\231-6057-�����¹��Ϸ������ݣ�ȫ����";

	////TEST
	////���ȫ���������ݲ���������ͬһ���ļ�
	////string filesPath="F:\\sql_out\\231-6057-�����¹��Ϸ������ݣ�ȫ���� - ��ȡȫ���¶�";
	////string filePath = "F:\\sql_out\\231_�޹���_�೵��_һ������";

	//string filePath = "F:\\sql_out\\��ͬ���ͳ���_һ������";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);

	////20161026
	//string filePath = "F:\\sql_out\\��ͬ���ͳ���_һ������2";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);

	////20161026
	//string filePath = "F:\\sql_out\\162_����������";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);	

	////Test
	//const int header_n=20;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};
	//string mergeTail = "allAxisTemperature";	
	//string extractFilePath = "F:\\sql_out\\231_�޹���_�೵��_һ������";
	////extractRelatedDataAndMerge(string extractFilePath, string header[], int header_n, string mergeFileTail);
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, mergeTail);


	////Test
	//const int header_n=20;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};
	//string mergeTail = "allAxisTemperature";	
	//string extractFilePath = "F:\\sql_out\\162_����������";
	////extractRelatedDataAndMerge(string extractFilePath, string header[], int header_n, string mergeFileTail);
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, mergeTail);

	////20161026
	//const int header_n=20;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};
	//string mergeTail = "allAxisTemperature";	
	//string extractFilePath = "F:\\sql_out\\20161026-���ͳ���ʱ��GroupTop100";
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, mergeTail);




	//20161103
	//string filePath = "F:\\sql_out\\20161103-�������±���_1��_axleTempFault";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);
	//------------------------------------------------------------------------------------
	//const int header_n=20;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};
	//string mergeTail = "allAxisTemperature";	
	//string extractFilePath = "F:\\sql_out\\20161103-�������±���_1��_axleTempFault";
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, mergeTail);

	////20161209
	//const int header_n=21;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED", "BTSJ"};
	//string mergeTail = "allAxisTemperature";	
	////string extractFilePath = "F:\\sql_out\\20161026-���ͳ���ʱ��GroupTop100";
	//string extractFilePath = "F:\\sql_out\\20161103-�������±���_1��_axleTempFault";
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, "allAxisTemperature");

	//handler.removeReplicatedBtsjRows("F:\\sql_out\\20161026-���ͳ���ʱ��GroupTop100\\out\\163_0151_2016-06-30_80_allAxisTemperature_merge2.csv");
	//handler.removeReplicatedBtsjRowsByDir("F:\\sql_out\\20161026-���ͳ���ʱ��GroupTop100\\out\\allaxistemperature_merge2");
	//handler.removeReplicatedBtsjRowsByDir("F:\\sql_out\\20161103-�������±���_1��_axleTempFault\\out\\merge with time");

	//����ļ������ļ��������ݵļ�¼��Ŀ
	//handler.getTheNumsOfFile("F:\\sql_out\\20161103-�������±���_1��_axleTempFault\\out\\4.remove duplication");

	
	////20161230
	////��1������¶�
	//string filePath = "E:\\Data_Lab\\20161229-239��-��ͬ����-5��·-itf_6a-��������2\\��ȱʡ";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);

	////20170104
	////233��-66666��-���������е�������
	////��1������¶�
	//string filePath = "E:\\Data_Lab\\20170104-233��-66666��-���������е�������";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);
	////��2����ȡ���P���ρ�
	//const int header_n=21;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED", "BTSJ"};
	//string mergeTail = "allAxisTemperature";	
	//string extractFilePath = "E:\\Data_Lab\\20170104-233��-66666��-���������е�������";
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, "allAxisTemperature");
	////��3���Ƴ����N
	//handler.removeReplicatedBtsjRowsByDir("E:\\Data_Lab\\20170104-233��-66666��-���������е�������\\out\\2. merge with time");

	////20170112
	////��1������¶�
	//string filePath = "E:\\Data_Lab\\20170104-233��-66666��-���������е�������";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);

	////20170211
	////����ʮ����ת������
	//vector<int> tmp = handler.decimalToBits(18);
	//����splitSwitchVariables
	////��ÿ�����Ϣ�б�
	//vector<SwitchInfo> switchInfoList = handler.getSwitchInfoList("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\itf_tcms_hxd_v20-swictInfoList.csv");
	//vector<string> removeIndexList = handler.getRemoveIndexList();
	//handler.splitSwitchVariables("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\tcms_1_cc66666_240_0143_2016-05-20.csv", switchInfoList, "_split", removeIndexList);
	////2010213
	////���Բ�������ļ�
	//handler.splitSwitchVariablesOfFiles("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\original");
	//ȥ��������,btsjIndex=1
	//handler.removeReplicatedBtsjRowsByDir3("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\original\\2. ɾ��������", 1);
	//handler.splitTmp();

	////20170405
	////���
	//string dir = "";
	//handler.splitTmpToDiffAxisWithComVars("E:\\Data_Lab\\20170104-233��-66666��-���������е�������\\out\\4. interpolation\\8000����");

	////20170405
	////���
	//string dir = "";
	//handler.splitTmpToDiffAxisWithComVars("E:\\Data_Lab\\20170104-233��-66666��-���������е�������\\out\\4. interpolation\\8000����");

	////20170104
	////233��-66666��-���������е�������
	////��1������¶�
	//string filePath = "E:\\Data_Lab\\��������";
	//string axisHeader[6] = {"ZX_WD_1","ZX_WD_2","ZX_WD_3","ZX_WD_4","ZX_WD_5","ZX_WD_6"};//��Ҫ�����¶Ȳ�ֵ�header����
	//int axisNum[6]={1,2,3,4,5,6};
	//handler.extractTemperatureOfPointedAxis(filePath, axisHeader, axisNum);
	////��2����ȡ���P���ρ�
	//const int header_n=21;
	//string header[header_n] = {"ZX_HW1_1","ZX_HW2_1","ZX_HW1_2","ZX_HW2_2","ZX_HW1_3","ZX_HW2_3","ZX_HW1_4","ZX_HW2_4","ZX_HW1_5","ZX_HW2_5","ZX_HW1_6","ZX_HW2_6","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED", "BTSJ"};
	//string mergeTail = "_merge";	
	//string extractFilePath = "E:\\Data_Lab\\��������";
	//handler.extractRelatedDataAndMerge(extractFilePath, header, header_n, mergeTail);
	//��3���Ƴ����N
	handler.removeReplicatedBtsjRowsByDir("E:\\Data_Lab\\��������\\out\\2.merge");

	cout << "pause..." <<endl;
	system("pause");
}
