package model;

import java.util.List;
import java.util.Map;

import utils.DBUtil;

public class User {
	
	private DBUtil db;
	
	public User(){
		db=new DBUtil();
	}
	//��ȡ���е��û���Ϣ
	public List<Map<String,String>> getUsers(){
		
		String sql="select * from user order by ident desc";
		return db.getList(sql);
	}
	
	
	//shan chu ʹ��ʱ��Ҫ�����β�id�������滻
	public int delUser(String id)
	{
		String sql = "delete from user where id=?";
		String[] params={id};
		return db.update(sql,params);
	}
	//���yonghu
	public int addUser(String name,String pass,String tel,String addr)
	{
		String sql = "insert into user  values(null,?,?,0,?,?)";
		String[] params={name,pass,tel,addr};
		return db.update(sql,params);
	}//��ӹ���Ա
	public int addUser1(String name,String pass,String tel,String addr)
	{
		String sql = "insert into user  values(null,?,?,1,?,?) ";
		String[] params={name,pass,tel,addr};
		return db.update(sql,params);
	}
	//��ѯһ���û�
	public Map<String,String> getUser(String id)
	{
		String sql = "select * from user where id=?";
		String[] params={id};
		return db.getMap(sql,params);
	}
	//�޸� 
	public int updateUser(String id,String name,String pass,String tel,String addr)
	{
		
		//String sql="update user set(?,?,?,?) where id=?";
		String sql="update user set userName=?,password=?,telephone=?,address=? where id=?";
		String[] params={name,pass,tel,addr,id};
		return db.update(sql,params);
	}
	
	//�����û����������ж��Ƿ��ǺϷ��û�
	public Map<String,String> checkUser(String name,String pass){
		String sql = "select * from user where userName=? and password=?";
		String[] params={name,pass};
		Map<String,String> map = db.getMap(sql,params);
		return map;
	}
	

	public int editUser(String id, String name, String pass, String tel, String addr) {
		String sql="update user set userName=?,password=?,telephone=?,address=? where id=?";
		String[]params={name,pass,tel,addr,id};
		return db.update(sql, params);
	}
	
}
