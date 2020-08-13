package ebook.DAO;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.TuKhoaTraCuu;
@Repository
public class TuKhoaTraCuuDAO implements TuKhoaTraCuuDAOimp {
	@Autowired
	SessionFactory factory;
	
	@Override
	public String insertTuKhoaTraCuu(String keyword) {
		TuKhoaTraCuu tuKhoaTraCuu = new TuKhoaTraCuu(keyword,new Date());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String res ;
		try {
			session.saveOrUpdate(tuKhoaTraCuu);
			t.commit();
			res = "success";
		}
		catch(Exception e) {
			t.rollback();
			System.out.println("insert tu khoa" + e.getMessage());
			res = e.getMessage();
		}
		finally {
			session.close();
		}
		return res;
	}

}
