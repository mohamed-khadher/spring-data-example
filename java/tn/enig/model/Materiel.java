package tn.enig.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Materiel {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String titre;
	private String type;
	private Long sn;
	private int qte;
	private boolean etat;
	private int depId;
	public Materiel() {
		super();
	}
	public Materiel(Integer id, String titre, String type, Long sn, int qte, boolean etat, int dep) {
		super();
		this.id = id;
		this.titre = titre;
		this.type = type;
		this.sn = sn;
		this.qte = qte;
		this.etat = etat;
		this.depId = dep;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Long getSn() {
		return sn;
	}
	public void setSn(Long sn) {
		this.sn = sn;
	}
	public int getQte() {
		return qte;
	}
	public void setQte(int qte) {
		this.qte = qte;
	}
	public boolean isEtat() {
		return etat;
	}
	public void setEtat(boolean etat) {
		this.etat = etat;
	}
	public int getDep() {
		return depId;
	}
	public void setDep(int dep) {
		this.depId = dep;
	}
}
