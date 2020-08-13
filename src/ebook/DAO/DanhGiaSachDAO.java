package ebook.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.DanhGiaSach;
@Repository
public class DanhGiaSachDAO implements DanhGiaSachDAOimp{
	@Autowired
	SessionFactory factory;

	@Override
	public List<DanhGiaSach> getListAssessmentOfTruyen(int idTruyen) {
Session session = factory.getCurrentSession();
		
		String hql = "SELECT e FROM DanhGiaSach e WHERE e.IdSach = "+idTruyen;
		Query query = session.createQuery(hql);
		List<DanhGiaSach> list = query.list();
		return list;
	}
}
