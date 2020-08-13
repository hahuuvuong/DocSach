package ebook.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ebook.entity.DocGia;
import ebook.entity.Sach;

@Repository
public class DocGiaDAO implements DocGiaDAOimp {
	@Autowired
	SessionFactory factory;

	@Override
	public boolean checkUsername(String username, String password) {
		Session session = factory.openSession();
		String hql = "FROM DocGia WHERE tenDangNhap = '" + username + "' AND matKhau = '" + password + "'";
		Query query = session.createQuery(hql);
		DocGia x = (DocGia) query.uniqueResult();
		session.close();
		if (x != null) {
			return true;
		}
		return false;
	}
	public DocGia returnAccount(String username) {
		Session session = factory.openSession();
		String hql = "SELECT e FROM DocGia e WHERE e.TenDangNhap = '" + username + "'";
		Query query = session.createQuery(hql);
		DocGia nickname = (DocGia) query.uniqueResult();
		session.close();
		return nickname;
	}
	public String returnNickname(String username) {
		Session session = factory.openSession();
		String hql = "SELECT e.TenDocGia FROM DocGia e WHERE e.TenDangNhap = '" + username + "'";
		Query query = session.createQuery(hql);
		String nickname = (String) query.uniqueResult();
		session.close();
		return nickname;
	}

	public DocGia returnRole(String username) {
		Session session = factory.openSession();

		String hql = "FROM DocGia e WHERE e.TenDangNhap = '" + username + "'";
		Query query = session.createQuery(hql);
		DocGia x = (DocGia) query.uniqueResult();
		session.close();

		return x;
	}

	public int saveFavBook(DocGia acc, Sach truyen) {
		Session session = factory.openSession();

		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(acc);
			session.saveOrUpdate(truyen);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			t.rollback();
		} finally {
			session.close();
		}
		return 1;
	}

	public List<Sach> returnFavBook(String username) {
		
		Session session = factory.openSession();
		String hql = "SELECT e FROM Sach e JOIN e.accounts r WHERE r.TenDangNhap = '" + username + "'";
		Query query = session.createQuery(hql);
		List<Sach> list  = query.list();
		session.close();
		return list;
	}
	public void deleteFavBook(String username, int id) {
		
		Session session = factory.openSession();
		try {
			String hql = "DELETE FROM favBook WHERE DocGia_Username = '" + username + "'" +" AND truyens_idTruyen ="+id+"";
			session.createSQLQuery(hql).executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			session.close();
		}
	}
	public List<DocGia> returnListUser(){
		Session session = factory.openSession();
		String hql = "FROM DocGia";
		Query query = session.createQuery(hql);
		List<DocGia> list = query.list();
		session.close();
		return list;
	}
}
