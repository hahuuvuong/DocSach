package ebook.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.Sach;

@Repository
public class SachDAO implements SachDAOimp {
	@Autowired
	SessionFactory factory;
	
	@Override
	public Sach returnSach(int id) {
		Session session = factory.openSession();
		
		String hql1 = "SELECT e FROM Sach e WHERE e.IdSach = "+id;
		Query query1 = session.createQuery(hql1);
		Sach x = (Sach) query1.uniqueResult();
		session.close();
		return x;
	}
	@Override
	public List<Sach> randomSach(int soluong){
		Session session = factory.getCurrentSession();
		List<Sach> list = new ArrayList<>();
		for(int i = 0; i<soluong+1;i++) {
			Random rand = new Random();
			int n = rand.nextInt(500);
			
			String hql = "SELECT e FROM Sach e WHERE e.IdSach = "+ n;
			Query query = session.createQuery(hql);
			list.add((Sach) query.uniqueResult());
		}
		return list;
	}
	@Override
	public List<Sach> SachTheoTheLoai(int idTheLoai){
		Session session = factory.getCurrentSession();
		String hql = "SELECT e FROM Sach e WHERE e.idTheLoai = " + idTheLoai;
		Query query = session.createQuery(hql);
		query.setMaxResults(12);
		List<Sach> list = query.list();
		return list;
	}
	@Override
	public List<Sach> SachTheLoai(int idTheLoai,int numPage){
		Session session = factory.getCurrentSession();
		String hql = "SELECT e FROM Sach e WHERE e.idTheLoai = " + idTheLoai;
		Query query = session.createQuery(hql);

		query.setFirstResult((numPage-1)*12 + 1);
		query.setMaxResults( 12);
		List<Sach> list = query.list();
		return list;
	}
	@Override
	public List<Sach> searchingSach(String keywords){
		Session session = factory.getCurrentSession();
		String hql = "SELECT e FROM Sach e WHERE e.TenSach LIKE '%"+keywords+"%'";
		System.out.println(hql);
		Query query = session.createQuery(hql);
		query.setMaxResults( 12);
		List<Sach> list = query.list();
		return list;
	}
	@Override
	public int amountOfSachs() {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Sach ";
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
	public List<Sach> allSach(int numPage){
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Sach ";
		Query query = session.createQuery(hql);
		query.setFirstResult((numPage-1)*12 + 1);
		query.setMaxResults( 12);
		List<Sach> list = query.list();
		return list;
	}
	@Override
	public List<Sach> returnAllSach(){
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Sach ";
		Query query = session.createQuery(hql);
		List<Sach> list = query.list();
		return list;
	}
}
