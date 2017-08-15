#VAR��ģ����
#data = all the selected data to be modled using VAR->���Ѿ�ɸѡ�õ�ÿ���������+�������
#sampleEndIndex = the end index of the sample data, it's also the start point of prediction->����ֻ�Ǵ�ʱ�������м�ĳһ����Ϊ�����յ㣬Ȼ��Ԥ�������prdRange���ȵ�����
#prdRange = the length need to be predicted
#col = which column will be shown, if col=0, means all will be shown->ѡ�񽨺õ�ģ�͵���һ����������������չ�֣�����0�Ļ���ȫ�����������ݴ���list�����ء�ĿǰĬ����ȫ�������ء�
func.var<-function(data, sampleEndIndex, prdRange, col){
  
  library("vars");
  
  result<-list()

  len<-nrow(data)#get the row number
  tmp.modelSample<-data[1:sampleEndIndex,]#get the samp
  varest<-VAR(tmp.modelSample,lag.max = 10,ic=c("SC"));#model the data
  varprd<-predict(varest,n.ahead = prdRange,ci=0.05);
  
  #browser()
  
  colist<-list()
  colvalue<-list()
  if(col == 0){

    for(col in 1:6){
      
      #browser()
      
      tmp.ori.prd.col<-data[(sampleEndIndex+1):(sampleEndIndex+prdRange),col];#get the original data to the corresbonding predic value for the pointed col
      tmp.prd.col<-varprd$fcst[[col]][,1];#get the predicted value of pointed column
      tmp.error<-abs(tmp.ori.prd.col-tmp.prd.col)/tmp.prd.col*100;#count the prediction error
      tmp.maxError<-max(tmp.error)
      #browser()
      
      #2.1 
      #draw the picture of predicted part
      min<-func.getMin(tmp.ori.prd.col,tmp.prd.col)
      max<-func.getMax(tmp.ori.prd.col,tmp.prd.col)
      #2.2
      #save
      pdf(file=as.character(func.getPicName(col,1)), bg="transparent")
      plot(tmp.ori.prd.col, type="l", ylim=c(min,max),col=c("blue"), xlab="Time Series", ylab="Tmperature")
      lines(tmp.prd.col,col=c("red"))
      #title(as.character(func.getTitle(col)))
      #legend("bottomleft",legend=c("observed data","predicted data"),col=c("blue","red"),lty=1)
      dev.off()
      #points(tmp.prd.col)
      
      #browser()
      
      #3.1
      #merge the sample to predicte data for graphic
      tmp.ori<-data[1:(sampleEndIndex+prdRange),col];#get the original sample of pointed column
      tmp.prd<-data[1:sampleEndIndex,col];
      tmp.prd[(sampleEndIndex+1):(sampleEndIndex+prdRange)]<-varprd$fcst[[col]][,1];#get the predicted value of the pointed column
      #3.2
      #plot the data
      pdf(file=as.character(func.getPicName(col,2)), bg="transparent")
      plot(tmp.ori, type="l", col=c("blue"), xlab="Time Series", ylab="Tmperature")
      lines(tmp.prd,col=c("red"))
      dev.off()
      
      #browser()
      
      #4.1
      #save the data
      colvalue[["ori"]]<-tmp.ori.prd.col
      colvalue[["prd"]]<-tmp.prd.col
      colvalue[["error"]]<-tmp.error
      colvalue[["maxError"]]<-tmp.maxError      
      colist[[col]]<-colvalue
    }
    
  }else{
    tmp.ori.prd.col<-data[(sampleEndIndex+1):(sampleEndIndex+prdRange),col];#get the original data to the corresbonding predic value for the pointed col
    tmp.prd.col<-varprd$fcst[[col]][,1];#get the predicted value of pointed column
    tmp.error<-abs(tmp.ori.prd.col-tmp.prd.col);#count the prediction error
    #browser()
    
    #2.1 
    #draw the picture of predicted part
    min<-func.getMin(tmp.ori.prd.col,tmp.prd.col)
    max<-func.getMax(tmp.ori.prd.col,tmp.prd.col)
    #2.2
    #save
    pdf(file=as.character(func.getPicName(col,1)), bg="transparent")
      plot(tmp.ori.prd.col, type="l", ylim=c(min,max),col=c("blue"), xlab="Time Series", ylab="Tmperature")
      lines(tmp.prd.col,col=c("red"))
      title(as.character(func.getTitle(col)))
      legend("bottomleft",legend=c("observed data","predicted data"),col=c("blue","red"),lty=1)
    dev.off()
    #points(tmp.prd.col)

    #browser()
    
    #3.1
    #merge the sample to predicte data for graphic
    tmp.ori<-data[1:(sampleEndIndex+prdRange),col];#get the original sample of pointed column
    tmp.prd<-data[1:sampleEndIndex,col];
    tmp.prd[(sampleEndIndex+1):(sampleEndIndex+prdRange)]<-varprd$fcst[[col]][,1];#get the predicted value of the pointed column
    #3.2
    #plot the data
    pdf(file=as.character(func.getPicName(col,2)), bg="transparent")
      plot(tmp.ori, type="l", col=c("blue"), xlab="Time Series", ylab="Tmperature")
      lines(tmp.prd,col=c("red"))
    dev.off()
    
    #browser()
    
    #4.1
    #save the data
    colvalue[["ori"]]<-tmp.ori.prd.col
    colvalue[["prd"]]<-tmp.prd.col
    colvalue[["error"]]<-tmp.error
    
    colist[[col]]<-colvalue
    
  }
  
  result[["sample"]]<-tmp.modelSample
  result[["varest"]]<-varest
  result[["varprd"]]<-varprd
  result[["colist"]]<-colist

  return(result)
}                               

#��ȫ����Ϣ���ļ����У��޳�����������ݣ��ϲ����������List
func.var.data<-function(allAxisTemp.merge){
  tmp.common<-allAxisTemp.merge[,52:56]#common part infomation needed to build VAR
  
  #for all the 6 axis
  res<-list(NULL)
  for(i in 0:5){
    
    #get the axle temperature for each axle 
    s<-(i*8+1);
    e<-((i+1)*8-2);
    tmp.axleData<-allAxisTemp.merge[,s:e];
    
    #get the environment temperature of the axle
    s<-(i*2+1+56);
    e<-((i+1)*2+56);
    tmp.hw<-allAxisTemp.merge[,s:e]
    
    #merge the data
    tmp<-tmp.axleData;
    tmp[,7:11]<-tmp.common;
    tmp[,12:13]<-tmp.hw;
    
    #add the data to the list
    res[[i+1]]<-tmp;
    
  }
  
  return(res)
}

#��������
----------------------------------------------------------------------------------
  #ƴ�Ӻ���
  #ƴ�ӻ�ͼ�����ļ�������
  func.getPicName<-function(col,index){
    
    t<-"pic_1";
    t<-paste(t,"_", sep = "")
    t<-paste(t,col, sep = "")
    t<-paste(t,"_", sep = "")
    t<-paste(t,index, sep = "")
    t<-paste(t,".pdf", sep = "")
    
    return(t)
  }
#ƴ�Ӻ���
#ƴ�ӻ�ͼTitle
func.getTitle<-function(col){
  t<-"Temperature for point "
  t<-paste(t,col,sep = "")
  t<-paste(t," of axle 1",sep = "")
  
  return(t)
}
#�������ֵ
func.getMax<-function(a,b){
  #browser()
  
  a.max<-max(a);
  b.max<-max(b);
  
  if(a.max>b.max)
    return(a.max)
  else
    return(b.max)
}
#������Сֵ
func.getMin<-function(a,b){
  a.min<-min(a);
  b.min<-min(b);
  
  if(a.min<b.min)
    return(a.min)
  else
    return(b.min)
}

#���Ժ���
-------------------------------------------------------------
#���Բ�ͬʱ�䳤�ȵ�Ԥ��
func.test<-function(){

  #setBreakpoint("VAR_Data_Analysis.R",51)
  untrace(func.var.data)
  res<-func.var.data(data.163.0151.0630.allAxisTemp.merge)
  #setBreakpoint("VAR_Data_Analysis.R",9)
  #browser()
  #untrace(func.var)
  lens<-c(1,10,20,30,40,50,60,90,120)
  #for(i in 1:length(lens)){
    
    #len<-60*lens[i]
    len<-90*60
    axle<-1
    endLen<-(nrow(res[[axle]])-len)
    res2<-func.var(res[[axle]],endLen, len, 0)
    
    mins<-c()
    maxs<-c()
    for(i in 1:6){
      tmp<-res2$colist[[i]]$error
      mins[i]<-min(tmp)
      maxs[i]<-max(tmp)
    }
    
    show(mins)
    show(maxs)
    show(max(maxs))
    
    browser()
    
  #}
  
  #browser()
  
  #return(res)
  #debug(func.var.data(data.163.0151.0630.allAxisTemp.merge));
}