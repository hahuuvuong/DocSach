package ebook.DAO;

import java.util.List;

import ebook.entity.ChuongSach;

public interface ChuongSachDAOimp {
	public List<ChuongSach> returnChuongSachSach(int idSach);
	public ChuongSach returnContentChuongSach(int idChuongSach);
	public int amountOfChuongSach();
	public List<ChuongSach> allChuongSach(int numPage);
	public void tangLuotDoc(int idChuong);
}
