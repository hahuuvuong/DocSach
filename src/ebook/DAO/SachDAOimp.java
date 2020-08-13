package ebook.DAO;

import java.util.List;

import ebook.entity.Sach;

public interface SachDAOimp {
	public Sach returnSach(int id);
	public List<Sach> randomSach(int soluong);
	public List<Sach> SachTheoTheLoai(int idTheLoai);
	public List<Sach> SachTheLoai(int idTheLoai,int numPage);
	public List<Sach> searchingSach(String keywords);
	public List<Sach> allSach(int numPage);
	public int amountOfSachs() ;
	public List<Sach> returnAllSach();
}
