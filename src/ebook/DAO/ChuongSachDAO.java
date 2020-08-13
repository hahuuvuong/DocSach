package ebook.DAO;

import java.sql.PreparedStatement;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.ChuongSach;
import ebook.entity.Sach;

@Repository
public class ChuongSachDAO implements ChuongSachDAOimp {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<ChuongSach> returnChuongSachSach(int idSach){
		Session session = factory.getCurrentSession();
		
		String hql = "SELECT e FROM ChuongSach e WHERE e.idSach = "+idSach;
		Query query = session.createQuery(hql);
		List<ChuongSach> list = query.list();
		
		return list;
	}
	@Override
	public ChuongSach returnContentChuongSach(int idChuongSach) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT e FROM ChuongSach e WHERE e.IdChuong = "+idChuongSach;
		Query query = session.createQuery(hql);
		ChuongSach x = (ChuongSach) query.uniqueResult();
		
		return x;
	}
	@Override
	public int amountOfChuongSach(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ChuongSach ";
		Query query = session.createQuery(hql);
		int sl = query.list().size();
		sl = sl-1;
		if(sl <= 12) {
			sl = 1;
		}
		else if ((sl%12)==0) {
			sl = sl/12 ;
		}
		else {
			sl= sl/12 +1 ;
		}
		return sl;
	}
	@Override
	public List<ChuongSach> allChuongSach(int numPage){
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ChuongSach ";
		Query query = session.createQuery(hql);
		query.setFirstResult((numPage-1)*12 + 1);
		query.setMaxResults( 12);
		List<ChuongSach> list = query.list();
		return list;
	}
	@Override
	public void tangLuotDoc(int idChuong) {

		Session session = factory.openSession();
		try {
			Query query = session.createSQLQuery("EXEC TangLuotDoc @idChuong = " +idChuong);
			query.executeUpdate();

		}
		catch(Exception e) {
			System.out.println("update luot doc" + e.getMessage());
		}
		finally {
			session.close();
		}
	}
}
