package Controller.DAO;


import java.sql.ResultSet;
import java.util.ArrayList;

public interface DAOInterface<T> {
    public int insertDB(T t);

    public int updateDB(T t);

    public int deleteDB(T t);

    public ArrayList<T> getFromRs(ResultSet rs) throws Exception;

    public ArrayList<T> selectAllDB();

    public ArrayList<T> selectByID(String id);

    public ArrayList<T> selectByCondition(String Condition);
}
