#include "stdafx.h"
#include "datahandler.h"
#include <set>
#include <iterator>

string DataHandler::getFilePath()
{

	string filePath = "F:\\sql_out\\231_������λ��������ǰ����";
	//string filePath = "F:\\sql_out\\231-6057-�����¹��Ϸ������ݣ�ȫ����";
	//string filePath = "F:\\sql_out\\231-6057-��B���Ϸ�������";
	//string filePath = "F:\\sql_out\\B�����4624229-��������";

	cout << "INFO: �ļ�·����" << filePath <<endl;

	return filePath;
}

void DataHandler::initData()
{
	////��ʼ����Ҫ��ȡ��header����
	//string tmp_names[n] = {"ZX_WD_2","ZX_HW1_2","ZX_HW2_2"};
	//memcpy(header_names_extract, tmp_names, sizeof(tmp_names));

	//��ʼ����Ҫ��ֵ��¶ȵ�header����
	string tmp_temperature_header[n_temperature] = {"ZX_WD_2"};
	memcpy(tmperature_header_extract, tmp_temperature_header, sizeof(tmp_temperature_header));
}

void DataHandler::extractDataForAnalysis(string filename, string name_tempera)
{
	cout << "extractDataForAnalysis: start..." <<endl;
	//��ʼ����Ҫ��ȡ��header����
	const int n_extract = 10;
	//string extract_header[n_extract] = {"ZX_HW1_2","ZX_HW2_2"};
	string extract_header[n_extract] = {"ZX_HW1_2","ZX_HW2_2","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};

	vector<vector<string>> data = getDataToHandle(extract_header, n_extract);
	filename.erase(filename.end()-4, filename.end());
	vector<string> split_filename = util.split(filename, "\\");
	split_filename.insert(split_filename.end()-1,"out");
	filename = util.merge(split_filename);

	string fileneme_temperature = filename+"-"+name_tempera+".csv";
	string filename_out = filename + "-tempera" + ".csv";
	cout << "INFO:��ȡ�¶���ع�������" <<endl;
	cout << "INFO:" << fileneme_temperature <<endl;
	vector<vector<string>> data_tempera = reader.readData(fileneme_temperature);

	vector<vector<string>> data_out;
	vector<int> delet_positions;

	cout << "INFO:�ϲ����ݵ���ͬһ�ļ�" <<endl;
	for(int i=0; i<data_tempera.size(); i++)
	{
		vector<string> tmp;
		
		////���ڲ�������¶ȼ�¼�����кţ�ֱ��������һ�е�����
		//if(data_tempera[i][0] == "-100")
		//{
		//	delet_positions.push_back(i);
		//	continue;
		//}

		//���ݺϲ���һ�У����뵽�������

		//���һ���������ݣ��ܹ�����һ����֤�����¶��ǺϷ��ģ�
		int flag = 0;
		for(int j=0; j<data_tempera[0].size(); j++)
		{
			tmp.push_back(data_tempera[i][j]);//�ȼ������
			if(data_tempera[i][0] == "-100")
			{
				delet_positions.push_back(i);
				flag = 1;
				break;
			}			
		}
		if(flag == 1)//һ����һ�е����������⣬�Ͳ������¼�飬������һ�������Ҫɾ��
			continue;

		//�����º��������ر�������
		for(int j=0; j<data[0].size(); j++)
		{
			if(data[i][j].size() < 1)//���Ϊnull
			{
				delet_positions.push_back(i);//����к�,��û�б�Ҫ�ٰ����ݼ������
				break;
			}
			tmp.push_back(data[i][j]);
		}
		data_out.push_back(tmp);
	}

	//ɾ����������
	//postionһ���ǰ����к��������ģ�ÿɾ��һ�У������position��Ҫ��ȥ1
	int minus = 0;
	for(int i=0; i<delet_positions.size(); i++)
	{
		data_out.erase(data_out.begin()+i-minus);
	}

	reader.writeData(filename_out, data_out);

	cout << "extractDataForAnalysis: end..." <<endl;
}

void DataHandler::axisTemperatureFunction()
{
	//initData();

	cout << "axisTemperatureFunction() start..." <<endl;

	string filepath = getFilePath();
	reader.readFilenameList(filepath, reader.filenameList);


	//��Ҫ�����¶Ȳ�ֵ�header����
	string str_names[n_temperature] = {"ZX_WD_2"};
	for(int i=0; i<reader.filenameList.size(); i++)
	{
		string filename = reader.filenameList[i];

		cout << "INFO: ��ȡ2���¶�" <<endl;
		reader.readData(filename);		
		
		
		//memcpy(str_names, tmperature_header_extract, sizeof(tmperature_header_extract));
		//�����Ҫ���������
		cout << "INFO: ��ô����������" <<endl;
		getDataToHandle(str_names, n_temperature);
		
		cout << "INFO: ���ݲ����ת��" <<endl;
		vector<vector<string>> temperatureList;

		for(int j=0; j<data_to_handle[0].size(); j++)
		{
			//���header
			vector<string> tmp;
			for(int i=0; i<8; i++)
			{
				stringstream ss;
				ss << i+1;
				tmp.push_back(str_names[j]+"_"+ss.str());				
			}
			temperatureList.push_back(tmp);
			//��Ӕ���
			for(int i=1; i<data_to_handle.size(); i++)//������һ��
			{
				if(data_to_handle[i][j].size() < 16)//����ȱʡ��ȥ������
				{
					vector<string> tmp(8,"-100");
					temperatureList.push_back(tmp);
				}else
				{
					temperatureList.push_back(split_temperature(data_to_handle[i][0]));	
				}			
			}

			cout << "INFO: ������������" <<endl;
			filename.erase(filename.end()-4, filename.end());
			vector<string> split_filename = util.split(filename, "\\");
			split_filename.insert(split_filename.end()-1,"out");
			filename = util.merge(split_filename);

			reader.writeData(filename+"-"+data_to_handle[0][j]+".csv",temperatureList);

			temperatureList.clear();	
		}

					//��ȡ�ض����P��׃�����ļ�
		filename = reader.filenameList[i];
		extractDataForAnalysis(filename, str_names[0]);
		
	}

	cout << "axisTemperatureFunction() end..." <<endl;
}
vector<vector<string>> DataHandler::getSplitedTemperatureList(vector<vector<string>> dataList,int axis, string axisName)
{
	vector<vector<string>> temperatureList;
	int n = 8;

	//���header
	vector<string> header;
	for(int i=0; i<n; i++)
	{
		stringstream ss;
		ss << i+1;
		header.push_back(axisName+"_"+ss.str());				
	}
	temperatureList.push_back(header);

	//�������
	//��16�����¶Ȳ�ֳ�8��10����
	int size = dataList.size();//row size
	for(int i=1; i<size; i++)//������һ��
	{
		if(dataList[i][axis].size() < 16)//����ȱʡ��ת����-100��֮������޳�
		{
			vector<string> dataSingle(8,"-100");
			temperatureList.push_back(dataSingle);
		}else
		{
			temperatureList.push_back(split_temperature(dataList[i][axis]));	
		}		
	}

	return temperatureList;
}
vector<string> DataHandler::split_temperature(string str)
{
	vector<string> temperatureList;
	int i=0;
	while((i+1) <= str.length())
	{
		string str_tmp = str.substr(i, 2);
		int int_tmp = util.hex_to_decimal(str_tmp.data(), 2);
		string val_tmp;
		util.int2str(int_tmp, val_tmp);
		temperatureList.push_back(val_tmp);
		i = i+2;
	}

	return temperatureList;
}

vector<vector<string>> DataHandler::getDataToHandle(string str_names[], int n)
{

	cout<<"INFO:��ȡ����:";
	for(int i=0; i<n; i++){
		cout << str_names[i] << ";";
	}
	cout <<endl;

	data_to_handle.clear();

	vector<string> names(str_names, str_names+n);
	vector<string> header = reader.data[0];

	//��Ҫ��ȡ���е�position
	vector<int> positions;
	for(int i=0; i<header.size(); i++)
	{
		for(int j=0; j<names.size(); j++)
		{
			if(header[i] == names[j])
			{
				positions.push_back(i);
				break;
			}
		}
	}
	
	//û�������
	if(positions.size() == 0)
	{
		cout << "ERROR: �ļ�����û���ҵ������������" <<endl;
		return data_to_handle;
	}

 	for(int i=0; i<reader.data.size(); i++)
	{
		vector<string> vec_tmp;
		for(int j=0; j<positions.size(); j++)
		{
			vec_tmp.push_back(reader.data[i][positions[j]]);
		}
		data_to_handle.push_back(vec_tmp);
	}

	return data_to_handle;
}

//������·��
string DataHandler::getOutputPath(string filename)
{
	filename.erase(filename.end()-4, filename.end());
	vector<string> split_filename = util.split(filename, "\\");
	split_filename.insert(split_filename.end()-1,"out");
	filename = util.merge(split_filename);

	return filename;
}
//���·��
vector<string> DataHandler::splitPath(string filename){
	filename.erase(filename.end()-4, filename.end());
	vector<string> split_filename = util.split(filename, "\\");

	return split_filename;
}
//����·��
vector<string> DataHandler::insertDirInPath(vector<string> path, string dir){
	path.insert(path.end()-1,dir);

	return path;
}
vector<string> DataHandler::upPath(vector<string> path){
	path.pop_back();
	return path;
}
//�����������·��
string DataHandler::getTailedPath(vector<string> path, string tail){
	string filename="";
	int i=0;
	for(; i<path.size()-1; i++){
		filename = filename+path[i]+"\\";
	}
	filename = filename+path[i]+tail+".csv";

	return filename;
}

//��ȡָ������������
void DataHandler::extractTemperatureOfPointedAxis(string filesPath, string axisHeader[], int axisNum[])
{
	cout<< "INFO:��ʼ-��ȡָ���������" <<endl;

	//���csv�ļ��б�
	reader.readFilenameList(filesPath, reader.filenameList);	

	//�����ļ����µ�csv�ļ�
	for(int i=0; i<reader.filenameList.size(); i++)
	{
		vector<vector<vector<string>>> allTemperatureList;

		//��ȡ�ļ�
		string filename = reader.filenameList[i];
		reader.readData(filename);	
		getDataToHandle(axisHeader,6);

		//����ÿ������¶Ƚ��в�������
		int size = data_to_handle[0].size();
		for(int j=0; j<size; j++)
		{
			//���ĳ�������ݵ��б�
			vector<vector<string>> temperatureList = getSplitedTemperatureList(data_to_handle, j, axisHeader[j]);			
			//������·��
			//string fileOutputPath = getOutputPath(filename);
			//�����ֺ����ݵ�csv
			//string tmp = axisHeader[j];
			//reader.writeData(fileOutputPath+"-"+tmp+".csv",temperatureList);

			//����Ӧ����¶ȷ����ܵ�vector
			allTemperatureList.push_back(temperatureList);
		}	

		//���ϸ����ֺ�����ݵ�ͳһ��vector
		vector<vector<string>> dataOutTemp;
		int rowSize = allTemperatureList[0].size();
		int axisSize = allTemperatureList.size();
		int colSize = allTemperatureList[0][0].size();
		for(int i=0; i<rowSize; i++)
		{
			vector<string> rowTmp;
			for(int j=0; j<axisSize; j++)
			{
				for(int k=0; k<colSize; k++)
				{
					rowTmp.push_back(allTemperatureList[j][i][k]);
				}				
			}
			dataOutTemp.push_back(rowTmp);
		}
		
		//������·��
		vector<string> path = insertDirInPath(splitPath(filename), "out\\1.axis");
		string fileOutputPath = getTailedPath(path,"_axis");
		//�����ֲ��������
		reader.writeData(fileOutputPath,dataOutTemp);
	}

	cout<< "INFO:����-��ȡָ���������" <<endl;
}

void DataHandler::extractRelatedDataAndMerge(string extractFilePath, string header[], int header_n, string mergeFileTail)
{
	//����ʾ��
	//��ʼ����Ҫ��ȡ��header����
	//const int n_extract = 10;
	//header[n_extract] = {"ZX_HW1_2","ZX_HW2_2","ZD_FLAG","ZD_ALT","ZD_CNT","ZD_LCG","ZD_TFG","ZD_JHG", "ZD_LLJ", "ZD_SPEED"};
	//extractFilePath = "F:\\sql_out\\231_�޹���_�೵��_һ������";
	//mergeTail = "allAxisTemperature";
	//header_n=10;

	//���csv�ļ��б�
	reader.readFilenameList(extractFilePath, reader.filenameList);	

	//�����ļ����µ�csv�ļ�
	for(int i=0; i<reader.filenameList.size(); i++)
	{
		//��ȡ����
		string filename = reader.filenameList[i];
		reader.readData(filename);	
		getDataToHandle(header,header_n);

		//������·��,Ҳ�Ǵ��ϲ����ݵ�·��
		vector<string> path = insertDirInPath(splitPath(filename), "out\\2.merge");
		string fileOutputPath = getTailedPath(path,"_merge");

		//��ȡ���ϲ�����
		path = insertDirInPath(splitPath(filename), "out\\1.axis");
		string mergeFilename = getTailedPath(path,"_axis");
		vector<vector<string>> data_to_merge = reader.readData(mergeFilename);

		vector<vector<string>> data_out;
		vector<int> delet_positions;

		cout << "INFO:�ϲ����ݵ���ͬһ�ļ�" <<endl;
		for(int i=0; i<data_to_merge.size(); i++)
		{
			vector<string> tmp;

			for(int j=0; j<data_to_merge[0].size(); j++)
			{
				tmp.push_back(data_to_merge[i][j]);//�ȼ������
				if(data_to_merge[i][j] == "-100")//һ����һ���пգ����������
				{
					delet_positions.push_back(i);
					break;
				}			
			}

			//�����º��������ر�������
			for(int j=0; j<data_to_handle[0].size(); j++)
			{
				if(data_to_handle[i][j].size() < 1)//���Ϊnull
				{
					delet_positions.push_back(i);//����к�,��û�б�Ҫ�ٰ����ݼ������
					break;
				}
				tmp.push_back(data_to_handle[i][j]);
			}
			data_out.push_back(tmp);
		}

		//ɾ����������
		//postionһ���ǰ����к��������ģ�ÿɾ��һ�У������position��Ҫ��ȥ1
		int minus = 0;
		for(int i=0; i<delet_positions.size(); i++)
		{
			if(i==132)
				cout<<"-----------"<<i<<endl;
			int t = delet_positions[i]-i;
			data_out.erase(data_out.begin()+t);
			
		}

		reader.writeData(fileOutputPath, data_out);	

	}



}

void DataHandler::splitTmpToDiffAxisWithComVars(string dir){
	
	//����ļ��б�
	reader.readFilenameList(dir, reader.filenameList);

	//�����ļ�
	for(int i=0; i<reader.filenameList.size(); i++){
		string filepath = reader.filenameList[i];
		reader.readData(filepath);	

		//������·��,Ҳ�Ǵ��ϲ����ݵ�·��
		vector<string> path = insertDirInPath(splitPath(filepath), "splitedAxis");
		//��������
		for(int j=0; j<6; j++){			
			vector<vector<string>> axisData;

			int nrow = reader.data.size();
			//����ÿһ��
			for(int r=0; r<nrow; r++){
				vector<string> row;
				int s = 8*j+1;
				int e = 8*(j+1)-2;
				//����
				for(int k=s; k<=e; k++){
					row.push_back(reader.data[r][k]);
				}
				//����
				s = 56+2*j+1;
				e = 56+2*(j+1);
				for(int k=s; k<=e; k++){
					row.push_back(reader.data[r][k]);
				}
				//��ر���
				s = 52;
				e = 56;
				for(int k=s; k<=e; k++){
					row.push_back(reader.data[r][k]);
				}

				axisData.push_back(row);
			}
			//���
			string tail = "_axis_"+to_string(j+1);
			string fileOutputPath = getTailedPath(path,tail);
			reader.writeData(fileOutputPath, axisData);
		}		
	}

}

//�����
//163_0151_2016-06-30_80_allAxisTemperature_merge2
//BTSJ=49��
vector<int*> DataHandler::getReplicatedBtsjIndex(vector<vector<string>> data){

	vector<int*> res;
	int btsj_n = 49;
	for(int i=1; i<data.size(); i++){
		
		//if(i==26237){
		//	cout<<i<<endl;
		//}
		int *tmp;
		if(data[i][btsj_n-1] == data[i-1][btsj_n-1]){		
			//cout<<"-----------------\n";
			tmp = new int[2];//tmp[0]=start index, tmp[1]=end index
			tmp[0]=i-1;
			while(data[i][btsj_n-1] == data[i-1][btsj_n-1]){				
				//outputRow(data[i-1]);
				i++;
				if(i==data.size()){
					break;
				}
			}	
			//outputRow(data[i-1]);
			tmp[1]=i-1;
			i--;
			res.push_back(tmp);
		}
	}	

	return res;
}

vector<int*> DataHandler::getReplicatedBtsjIndex3(vector<vector<string>> data, int btsjIndex){

	vector<int*> res;
	int btsj_n = btsjIndex;
	for(int i=1; i<data.size(); i++){
		
		//if(i==26237){
		//	cout<<i<<endl;
		//}
		int *tmp;
		if(data[i][btsj_n-1] == data[i-1][btsj_n-1]){		
			//cout<<"-----------------\n";
			tmp = new int[2];//tmp[0]=start index, tmp[1]=end index
			tmp[0]=i-1;
			while(data[i][btsj_n-1] == data[i-1][btsj_n-1]){				
				//outputRow(data[i-1]);
				i++;
				if(i==data.size()){
					break;
				}
			}	
			//outputRow(data[i-1]);
			tmp[1]=i-1;
			i--;
			res.push_back(tmp);
		}
	}	

	return res;
}

void DataHandler::outputRow(vector<string> row){
	for(int i=0; i<row.size(); i++){
		 cout<<row[i] << " ";
	}
	cout<<endl;
}

//����������������ݣ�����������ȣ�������һ������
vector<vector<string>> DataHandler::removeReplicatedBtsjRows(string filename){

	cout<< "START: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	vector<vector<string>> data = reader.readData(filename);
	vector<int*> replicatedBtsjIndex = getReplicatedBtsjIndex(data);
	
	//�ظ���ʱ�����ݿ���������ʱ���ȡ����ԭ������ֻ��ȷ����
	//���ں����о���ʱ����������Ϊ��λ�����Խ���ȷ�������ͬ���ݽ�������
	//�����۲죺ʱ����ͬ�����ݣ����´󲿷���ͬ���ٲ��ֲ�ͬ
	//��ͬʱ������ȡ��һ��
	int len = replicatedBtsjIndex.size();
	int remove_len = 0;
	for(int i=0; i<len; i++){
		/*cout<<i<<endl;*/
		//if(i==7970){
		//	cout<<i<<endl;
		//}
		int start = replicatedBtsjIndex[i][0];
		int end = replicatedBtsjIndex[i][1];
		for(int j=start+1; j<=end; j++){
			int tmp = j-remove_len;
			data.erase(data.begin()+tmp);
			remove_len++;
		}
		//remove_len = remove_len + (end-start);
	}
	vector<string> path = dirUpInPath(splitPath(filename));
	//path = upPath(path);
	path = insertDirInPath(path, "3.remove");	
	string tmp = path[path.size()-1];
	path[path.size()-1] = tmp.substr(0,tmp.length()-6);

	string outputPath = getTailedPath(path, "_rm");
	reader.writeData(outputPath, data);
	

	cout<< "END: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	return data;
}

//����������������ݣ�����������ȣ�������һ������
vector<vector<string>> DataHandler::removeReplicatedBtsjRows3(string filename, int btsjIndex){

	cout<< "START: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	vector<vector<string>> data = reader.readData(filename);
	vector<int*> replicatedBtsjIndex = getReplicatedBtsjIndex3(data, btsjIndex);
	
	//�ظ���ʱ�����ݿ���������ʱ���ȡ����ԭ������ֻ��ȷ����
	//���ں����о���ʱ����������Ϊ��λ�����Խ���ȷ�������ͬ���ݽ�������
	//�����۲죺ʱ����ͬ�����ݣ����´󲿷���ͬ���ٲ��ֲ�ͬ
	//��ͬʱ������ȡ��һ��
	int len = replicatedBtsjIndex.size();
	int remove_len = 0;
	for(int i=0; i<len; i++){
		/*cout<<i<<endl;*/
		//if(i==7970){
		//	cout<<i<<endl;
		//}
		int start = replicatedBtsjIndex[i][0];
		int end = replicatedBtsjIndex[i][1];
		for(int j=start+1; j<=end; j++){
			int tmp = j-remove_len;
			data.erase(data.begin()+tmp);
			remove_len++;
		}
		//remove_len = remove_len + (end-start);
	}
	vector<string> path = dirUpInPath(splitPath(filename));
	path = insertDirInPath(path, "ɾ��������");	
	string outputPath = getTailedPath(path, "_rm");
	reader.writeData(outputPath, data);
	

	cout<< "END: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	return data;
}

//�������������ݣ��������ݵ�ֵ��һ�£���Ҫ����ɸѡ���������ֵ
vector<vector<string>> DataHandler::removeReplicatedBtsjRows2(string filename){

	cout<< "START: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	vector<vector<string>> data = reader.readData(filename);
	vector<int*> replicatedBtsjIndex = getReplicatedBtsjIndex(data);
	
	//�ظ���ʱ�����ݿ���������ʱ���ȡ����ԭ������ֻ��ȷ����
	//���ں����о���ʱ����������Ϊ��λ�����Խ���ȷ�������ͬ���ݽ�������
	//�����۲죺ʱ����ͬ�����ݣ����´󲿷���ͬ���ٲ��ֲ�ͬ
	//��ͬʱ������ȡ��һ��
	int len = replicatedBtsjIndex.size();
	int remove_len = 0;
	for(int i=0; i<len; i++){

		//if(i == 452){
		//	printf("ERROR TEST: %d",i);
		//}

		/*cout<<i<<endl;*/
		//if(i==7970){
		//	cout<<i<<endl;
		//}
		int start = replicatedBtsjIndex[i][0];
		int end = replicatedBtsjIndex[i][1];
		//�ҵ�ʱ�����ͬ�ļ�¼����ֵ��С���е�index
		int min_index = start;
		for(int j=start+1; j<=end; j++){
			if(data[min_index-remove_len][0] > data[j-remove_len][0]){
				min_index = j;
			}
		}
		//ɾ����Сindex��������ظ���
		for(int j=start; j<=end; j++){
			if(j==min_index){
				continue;
			}
			int tmp = j-remove_len;
			data.erase(data.begin()+tmp);
			remove_len++;
		}
		//remove_len = remove_len + (end-start);
	}
	vector<string> path = dirUpInPath(splitPath(filename));
	path = insertDirInPath(path, "3. remove duplication");	
	string outputPath = getTailedPath(path, "_r");
	reader.writeData(outputPath, data);
	printf("\nLength:%d\n\n",data.size());
	cout<< "END: �Ƴ��ļ�" << filename << "��ʱ���ظ�������" <<endl;

	return data;
}


void DataHandler::removeReplicatedBtsjRowsByDir(string dir){
	cout<< "START: �Ƴ�Ŀ¼" << dir << "���ļ���ʱ���ظ�������" <<endl;

	//���csv�ļ��б�
	reader.readFilenameList(dir, reader.filenameList);	

	for(int i=0; i<reader.filenameList.size(); i++){
		string filename = reader.filenameList[i];
		removeReplicatedBtsjRows(filename);
	}

	cout<< "END: �Ƴ�Ŀ¼" << dir << "���ļ���ʱ���ظ�������" <<endl;
}

void DataHandler::removeReplicatedBtsjRowsByDir3(string dir, int btsjIndex){
	cout<< "START: �Ƴ�Ŀ¼" << dir << "���ļ���ʱ���ظ�������" <<endl;

	//���csv�ļ��б�
	reader.readFilenameList(dir, reader.filenameList);	

	for(int i=0; i<reader.filenameList.size(); i++){
		string filename = reader.filenameList[i];
		removeReplicatedBtsjRows3(filename, btsjIndex);
	}

	cout<< "END: �Ƴ�Ŀ¼" << dir << "���ļ���ʱ���ظ�������" <<endl;
}

vector<string> DataHandler::dirUpInPath(vector<string> path){
	path.erase(path.end()-2);
	return path;
}
//����ļ������ļ��������ݵļ�¼��Ŀ
void DataHandler::getTheNumsOfFile(string dir){
	vector<vector<string>> data_out;

	reader.readFilenameList(dir, reader.filenameList);
	for(int i=0; i<reader.filenameList.size(); i++){
		vector<string> tmp;

		string filename = reader.filenameList[i];
		reader.readData(filename);
		string num = to_string(reader.data.size());
		tmp.push_back(num);
		tmp.push_back(reader.filenameList[i]);

		data_out.push_back(tmp);
	}
	reader.writeData(dir+"\\tmp.csv",data_out);
}

void DataHandler::splitTmp(){
	string fileDir = "E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\original\\2. ɾ��������";
	vector<string> filenameList;
	reader.readFilenameList(fileDir, filenameList);
	filenameList = reader.filenameList;

	vector<SwitchInfo> switchInfoList;
	SwitchInfo t;
	t.set(52,"FZ_YBSXDLQZT",3);
	switchInfoList.push_back(t);
	t.set(53,"FZ_YSJGZ",2);
	switchInfoList.push_back(t);

	int n_filenum = filenameList.size();
	for(int i=0; i<n_filenum; i++){
		string filename = filenameList[i];
		vector<vector<string>> data = reader.readData(filename);
		int n_row = data.size();
		data = colToRowReverse(data);
		vector<vector<string>> data_out;
		int n_switch = switchInfoList.size();
		for(int i=0; i<n_switch; i++){
			SwitchInfo s = switchInfoList[i];
			vector<vector<string>> splited = splitSwitchVariable(data[s.index], s.n_bits);
			//������Ϊ���Ĳ�����ݱ������Ϊ�����vector
			splited = colToRowReverse(splited);
			//����header
			for(int j=0; j<s.n_bits; j++){
				string header_name = s.name + "_" + to_string(j+1);
				splited[j].insert(splited[j].begin(), header_name);

				//����������
				data_out.push_back(splited[j]);
			}		
		}

		data.erase(data.begin()+52);
		data.erase(data.begin()+(53-1));

		
		//�ϲ�ԭʼ���� & ������ݵ��������
		data_out.insert(data_out.begin(), data.begin(), data.end());

		//������ݵ�csv
	
		string filename_out = getTailedPath(insertDirInPath(splitPath(filename),"out"), "_2");
		data_out = colToRowReverse(data_out);
		reader.writeData(filename_out, data_out);

	}

	
}

vector<vector<string>> DataHandler::splitSwitchVariable(vector<string> decimalList, int n_bits)
{
	vector<vector<string>> switchList;
	
	int n_row = decimalList.size();
	//����head
	for(int i=1; i<n_row; i++){
		vector<string> tmp = decimalToBits(stoi(decimalList[i]), n_bits);
		switchList.push_back(tmp);
	}

	return switchList;
}

//���һ���ļ��е����п�����
void DataHandler::splitSwitchVariables(string filename, vector<SwitchInfo> switchInfoList, string tail, vector<string> removeIndexList){
	vector<vector<string>> data = reader.readData(filename);
	int n_row = data.size();
	//ת������Ϊ��Ϊ����vector
	data = colToRowReverse(data);

	////��ÿ�����Ϣ�б�
	//vector<SwitchInfo> switchInfoList = getSwitchInfoList("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\itf_tcms_hxd_v20-swictInfoList.csv");
	
	//���ÿһ������,�������
	vector<vector<string>> data_out;	
	int n_switch = switchInfoList.size();
	for(int i=0; i<n_switch; i++){
		SwitchInfo s = switchInfoList[i];
		vector<vector<string>> splited = splitSwitchVariable(data[s.index], s.n_bits);
		//������Ϊ���Ĳ�����ݱ������Ϊ�����vector
		splited = colToRowReverse(splited);
		//����header
		for(int j=0; j<s.n_bits; j++){
			string header_name = s.name + "_" + to_string(j+1);
			splited[j].insert(splited[j].begin(), header_name);

			//����������
			data_out.push_back(splited[j]);
		}
		
		////��û�����ز�ֺ��ֵ�ŵ�һ��
		//SwitchSplited tmp;
		//tmp.set(s, splited);
		//switchSplitedList.push_back(tmp);		
	}

	//ɾ��ԭʼ�����в���Ҫ����
	//���ִ���Ҫ�� index ����
	int count=0;
	int n_rm = removeIndexList.size();
	//����header
	for(int i=1; i<n_rm; i++){
		int index = stoi(removeIndexList[i]);
		data.erase(data.begin()+(index-count));
		count++;
	}	 
	//int count=0;
	//for(int i=0; i<n_switch; i++){
	//	int index = switchInfoList[i].index;
	//	data.erase(data.begin()+(index-count));
	//	count++;
	//}

	//�ϲ�ԭʼ���� & ������ݵ��������
	data_out.insert(data_out.begin(), data.begin(), data.end());

	//������ݵ�csv
	
	string filename_out = getTailedPath(insertDirInPath(splitPath(filename),"out"), tail);
	data_out = colToRowReverse(data_out);
	reader.writeData(filename_out, data_out);


	////������ֺ������
	//for(int i=0; i<n_switch; i++){
	//	//��header����ÿһ�У�Ҳ����ÿ��vector��index=0��
	//	int n_bits = switchInfoList[i].n_bits;
	//	for(int j=0; j<n_bits; j++){
	//		vector<string> tmp = switchSplitedList[j].splited;
	//	}
	//}

}

void DataHandler::splitSwitchVariablesOfFiles(string fileDir){

	vector<SwitchInfo> switchInfoList = getSwitchInfoList("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\itf_tcms_hxd_v20-swictInfoList.csv");
	vector<string> removeIndexList = getRemoveIndexList("E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\itf_tcms_hxd_v20-removeList.csv");

	vector<string> filenameList;
	reader.readFilenameList(fileDir, filenameList);
	filenameList = reader.filenameList;

	int n_filenum = filenameList.size();
	for(int i=0; i<n_filenum; i++){
		string filename = filenameList[i];
		splitSwitchVariables(filename, switchInfoList, "_split", removeIndexList);
	}
}

vector<SwitchInfo> DataHandler::getSwitchInfoList(string filename){
	vector<vector<string>> data = reader.readData(filename);
	vector<SwitchInfo> switchInfoList;
	int n_row = data.size();
	//������һ�У���һ��Ϊheader
	for(int i=1; i<n_row; i++){
		SwitchInfo tmp;
		tmp.set(stoi(data[i][0]),data[i][1],stoi(data[i][2]));

		switchInfoList.push_back(tmp);
	}
	
	return switchInfoList;
}

vector<vector<string>> DataHandler::colToRowReverse(vector<vector<string>> data){
	vector<vector<string>>  dataReversed;
	int n_col = data[0].size();
	int n_row = data.size();
	for(int i=0; i<n_col; i++){
		vector<string> tmp;
		for(int j=0; j<n_row; j++){
			tmp.push_back(data[j][i]);
		}
		dataReversed.push_back(tmp);
	}
	return dataReversed;
}

vector<string> DataHandler::decimalToBits(int decimal, int n_bits)
{
	vector<string> bitVector;
	int n = n_bits;//����Ϊn_bitsλbitλ

	for(int i=n-1; i>=0; i--){
		if(decimal&(1<<i))
			bitVector.push_back("1");
		else
			bitVector.push_back("0");
	}

	return bitVector;
}

	vector<string> DataHandler::getRemoveIndexList(string filename){		
		vector<vector<string>> data = reader.readData(filename);
		data = colToRowReverse(data);

		return data[0];
	}


