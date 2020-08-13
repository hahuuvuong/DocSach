package ebook.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.TheLoai;

@Repository
public class TheLoaiDAO implements TheLoaiDAOimp {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<TheLoai> returnTheLoai(){
		Session session = factory.getCurrentSession();
		
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		List<TheLoai> list = query.list();
		
		return list;
	}
	@Override
	public int amountOfTruyen(int idTheLoai) {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Sach WHERE idTheLoai = " + idTheLoai;
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
	public TheLoai returnChiTietTheLoai(int idTheLoai) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai e WHERE e.IdTheLoai = " + idTheLoai;
		Query query = session.createQuery(hql);
		
		TheLoai x = (TheLoai) query.uniqueResult();
		
		return x;
	}
}
