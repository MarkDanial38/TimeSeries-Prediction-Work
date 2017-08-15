#include "commonheader.h"
#include "csvreader.h"

//������ϢStruct
typedef struct SwitchInfo{
	int index;
	string name;
	int n_bits;

	void set(int a, string b, int c){
		index = a;
		name = b;
		n_bits = c;
	};
};

typedef struct SwitchSplited{
	SwitchInfo s;
	vector<vector<string>> splited;//��Ϊ����vector

	void set(SwitchInfo a, vector<vector<string>> b){
		s = a;
		splited = b;
	};
};

class DataHandler
{
private:

public:
	CSVReader reader;
	HelpUtil util;
	vector<vector<string>> data_to_handle;

	static const int  n = 3;
	string header_names_extract[n];

	static const int n_temperature = 1;
	string tmperature_header_extract[n_temperature];

public:
	void axisTemperatureFunction();
	void initData();

//��ȡ����
public:
	void extractDataForAnalysis(string filename, string name_temperature);//��ȡ������¶��������
	void extractTemperatureOfPointedAxis(string filesPath, string axisHeader[], int axisNum[]);//��ȡָ������������
	void extractRelatedDataAndMerge(string extractFilePath, string header[], int header_n, string mergeFileTail);	
	//���ز������ݲ�ֳɲ�ͬ��+��ͬ��ر���������LSTM
	void splitTmpToDiffAxisWithComVars(string path);
	
	string getFilePath();

//��������
public:
	//ɾ������
	vector<int*> getReplicatedBtsjIndex(vector<vector<string>> data);
	vector<int*> getReplicatedBtsjIndex3(vector<vector<string>> data, int btsjIndex);
	vector<vector<string>> removeReplicatedBtsjRows(string filename);
	vector<vector<string>> removeReplicatedBtsjRows3(string filename, int btsjIndex);
	vector<vector<string>> removeReplicatedBtsjRows2(string filename);//���������ҵ����ݼ�����ͬʱ��������ȡ��������
	void removeReplicatedBtsjRowsByDir(string dir);
	void removeReplicatedBtsjRowsByDir3(string dir, int btsjIndex);

	void getTheNumsOfFile(string dir);

	//��⿪����,���ز��������
	//��δ���head
	vector<vector<string>> splitSwitchVariable(vector<string> decimalList, int n_bits);
	//���һ���ļ��е����п�����
	void splitSwitchVariables(string filename, vector<SwitchInfo> switchInfoList,string tail, vector<string> removeIndexList);
	//�����ⲿ�ļ�����ÿ�������Ϣ
	vector<SwitchInfo> getSwitchInfoList(string filename);
	//��ò���Ҫ���е�index
	vector<string> getRemoveIndexList(string filename);
	//��ֶ���ļ�
	void splitSwitchVariablesOfFiles(string fileDir);
	//
	void splitTmp();
	
//help function
public:
	vector<vector<string>> getDataToHandle(string str_names[], int n);
	void outputRow(vector<string> row);
	vector<string> splitPath(string filename);
	vector<string> insertDirInPath(vector<string> path, string dir);
	vector<string> upPath(vector<string> path);
	vector<string> dirUpInPath(vector<string> path);
	string getTailedPath(vector<string> path, string tail);
	vector<string> decimalToBits(int decimal, int n_bits);//ʮ����ת����8λ�Ķ�����
	vector<vector<string>> colToRowReverse(vector<vector<string>> data);//������Ϊ���洢��vector�������Ϊ���洢��

private:
	vector<string> split_temperature(string str);
	vector<vector<string>> getSplitedTemperatureList(vector<vector<string>> dataList,int axis, string axisName);
	string getOutputPath(string filename);
	

};

