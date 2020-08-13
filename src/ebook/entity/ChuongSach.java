package ebook.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ChuongSach")
public class ChuongSach {
	@Id
	@GeneratedValue
	private int IdChuong;
	@ManyToOne
	@JoinColumn(name = "IdSach")
	private Sach idSach;
	private String NoiDung;
	private String TenChuong;
	private int LuotDoc;
	public int getLuotDoc() {
		return LuotDoc;
	}
	public void setLuotDoc(int LuotDoc) {
		LuotDoc = LuotDoc;
	}
	public ChuongSach() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChuongSach(int idChuong, Sach idSach, String noiDung, String tenChuong) {
		super();
		IdChuong = idChuong;
		this.idSach = idSach;
		NoiDung = noiDung;
		TenChuong = tenChuong;
	}
	public int getIdChuong() {
		return IdChuong;
	}
	public void setIdChuong(int idChuong) {
		IdChuong = idChuong;
	}
	public Sach getIdSach() {
		return idSach;
	}
	public void setIdSach(Sach idSach) {
		this.idSach = idSach;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public String getTenChuong() {
		return TenChuong;
	}
	public void setTenChuong(String tenChuong) {
		TenChuong = tenChuong;
	}
	
}
