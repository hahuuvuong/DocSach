package ebook.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "LichSuDoc")
public class LichSuDoc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdLichSuDoc;
	
	@ManyToOne
	@JoinColumn(name = "IdSach")
	private Sach IdSach;
	
	@ManyToOne
	@JoinColumn(name = "IdDocGia")
	private DocGia IdDocGia;
	
	@ManyToOne
	@JoinColumn(name = "IdChuong")
	private ChuongSach IdChuong;
	
	@Column(name = "ViTri")
	private float ViTri;
	
	@Column(name = "ThoiGian")
	private Date ThoiGian;

	public LichSuDoc() {
		super();
	}

	
	public LichSuDoc(Sach idSach, DocGia idDocGia, ChuongSach idChuong, float viTri, Date thoiGian) {
		super();
		IdSach = idSach;
		IdDocGia = idDocGia;
		IdChuong = idChuong;
		ViTri = viTri;
		ThoiGian = thoiGian;
	}


	public int getIdLichSuDoc() {
		return IdLichSuDoc;
	}

	public void setIdLichSuDoc(int idLichSuDoc) {
		IdLichSuDoc = idLichSuDoc;
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

	public ChuongSach getIdChuong() {
		return IdChuong;
	}

	public void setIdChuong(ChuongSach idChuong) {
		IdChuong = idChuong;
	}

	public float getViTri() {
		return ViTri;
	}

	public void setViTri(float viTri) {
		ViTri = viTri;
	}

	public Date getThoiGian() {
		return ThoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		ThoiGian = thoiGian;
	}

}
