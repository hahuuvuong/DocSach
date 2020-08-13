package ebook.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.LichSuDoc;

@Repository
public class LichSuDocDAO implements LichSuDocDAOimp {
	@Autowired
	SessionFactory factory;

	@Override
	public int checkBookmarkExist(int idSach, int idDocGia) {
		Session session = factory.openSession();
		String hql = "SELECT e FROM LichSuDoc e  WHERE e.IdSach = " + idSach +" AND e.IdDocGia = " +idDocGia;
		Query query = session.createQuery(hql);
		LichSuDoc lichSuDoc = (LichSuDoc) query.uniqueResult();
		if(lichSuDoc == null)
			return -1;
		return lichSuDoc.getIdLichSuDoc();
	}

}
