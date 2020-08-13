package ebook.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DanhGiaSach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="IdDanhGia")
	int IdDanhGia;
	
	@Column(name="SoDiem")
	int SoDiem;
	
	@Column(name="TieuDe")
	String TieuDe;
	
	@Column(name="NoiDung")
	String NoiDung;
	
	@Column(name="ThoiGian")
	Date ThoiGian;
	
	public Date getThoiGian() {
		return ThoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		ThoiGian = thoiGian;
	}

	@ManyToOne
	@JoinColumn(name = "IdSach")
	private Sach IdSach;
	
	@ManyToOne
	@JoinColumn(name = "IdDocGia")
	private DocGia IdDocGia;

	public DanhGiaSach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DanhGiaSach(int idDanhGia, int soDiem, String tieuDe, String noiDung, Sach idSach, DocGia idDocGia) {
		super();
		IdDanhGia = idDanhGia;
		SoDiem = soDiem;
		TieuDe = tieuDe;
		NoiDung = noiDung;
		IdSach = idSach;
		IdDocGia = idDocGia;
	}

	public int getIdDanhGia() {
		return IdDanhGia;
	}

	public void setIdDanhGia(int idDanhGia) {
		IdDanhGia = idDanhGia;
	}

	public int getSoDiem() {
		return SoDiem;
	}

	public void setSoDiem(int soDiem) {
		SoDiem = soDiem;
	}

	public String getTieuDe() {
		return TieuDe;
	}

	public void setTieuDe(String tieuDe) {
		TieuDe = tieuDe;
	}

	public String getNoiDung() {
		return NoiDung;
	}

	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}

	public Sach getIdSach() {
		return IdSach;
	}

	public void setIdSach(Sach idSach) {
		IdSach = idSach;
	}

	public DocGia getIdDocGia() {
		return IdDocGia;
	}

	public void setIdDocGia(DocGia idDocGia) {
		IdDocGia = idDocGia;
	}
	
}
