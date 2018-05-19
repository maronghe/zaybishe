package model;
import java.util.List;
import java.util.Map;

import utils.DBUtil;
public class Turang {
	private DBUtil db;
	
	public Turang(){
		db=new DBUtil();
}
	//cha  
		public List<Map<String,String>> getTurang(){
			String sql = "select * from turang";
			return db.getList(sql);
		}

		
}
