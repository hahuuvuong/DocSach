package ebook.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TacGia")
public class TacGia {
	@Id
	private int IdTacGia;
	
	private String TenTacGia;
	private String ThongTin;
	private String GhiChu;
	
	@ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH})
	@JoinTable(
			name = "SangTac",
			joinColumns = { @JoinColumn(referencedColumnName = "IdTacGia")},
			inverseJoinColumns = {@JoinColumn (referencedColumnName = "IdSach")}
			)
	Set<Sach> sachs = new HashSet<>(0);
	
	public int getIdTacGia() {
		return IdTacGia;
	}
	public void setIdTacGia(int idTacGia) {
		IdTacGia = idTacGia;
	}
	public String getTenTacGia() {
		return TenTacGia;
	}
	public void setTenTacGia(String tenTacGia) {
		TenTacGia = tenTacGia;
	}
	public String getThongTin() {
		return ThongTin;
	}
	public void setThongTin(String thongTin) {
		ThongTin = thongTin;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	public TacGia() {
		super();
	}
	public TacGia(int idTacGia, String tenTacGia, String thongTin, String ghiChu) {
		super();
		IdTacGia = idTacGia;
		TenTacGia = tenTacGia;
		ThongTin = thongTin;
		GhiChu = ghiChu;
	}
	
}
