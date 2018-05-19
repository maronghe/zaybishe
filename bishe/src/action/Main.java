package action;
import javax.swing.*;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

public class Main {public String go(String xmlInfo) throws UnknownHostException, IOException {

    // 向服务器端发送请求，服务器IP地址和服务器监听的端口号
    Socket client = new Socket("192.168.4.1", 9000);

    // 通过printWriter 来向服务器发送消息
    PrintWriter printWriter = new PrintWriter(client.getOutputStream());
    //System.out.println("连接已建立...");

    // 发送消息
    printWriter.println(xmlInfo);

    printWriter.flush();

    // InputStreamReader是低层和高层串流之间的桥梁
    // client.getInputStream()从Socket取得输入串流
    InputStreamReader streamReader = new InputStreamReader(client.getInputStream());

    // 链接数据串流，建立BufferedReader来读取，将
    //BufferReader链接到InputStreamReder
    BufferedReader reader = new BufferedReader(streamReader);
    StringBuilder sb = new StringBuilder();
   String str ;
    if((str = reader.readLine()) != null){
    	sb.append(str);
    }
    String advice =sb.toString();
    reader.close();
    return advice;
}

public static void main(String[] args) throws UnknownHostException,IOException {

    StringBuilder sb = new StringBuilder();
    sb.append("balabala");
    // 提交请求

    String utf8 = new String(sb.toString(). getBytes("UTF-8"));
    String unicode = new String(utf8.getBytes(), "UTF-8");
    String gbk = new String(unicode.getBytes("GB2312"));
    // String xml = new String();//GB18030
    Main c = new Main();
    while(true){
    	String advice = c.go(gbk);
    	System.out.print( advice+ " \t");
    	
        String[] strs = advice.split("\\|");
        System.out.print("GuangZhao ：" + strs[0]);
        System.out.println("\t Shidu:"+strs[1]);
        
    }
    
}
}
       