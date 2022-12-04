package tn.enig.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tn.enig.dao.IDepartement;
import tn.enig.dao.IMateriel;
import tn.enig.model.Departement;
import tn.enig.model.Materiel;

@Controller
public class AppController {
	@Autowired
	private IDepartement departementRepo;
	@Autowired
	private IMateriel materielRepo;
	
	public void setDepartementRepo(IDepartement departementRepo) {
		this.departementRepo = departementRepo;
	}
	
	public void setMaterielRepo(IMateriel materielRepo) {
		this.materielRepo = materielRepo;
	}
	
	@GetMapping("/home")
	public String home(Model m) {
		List<Departement> deps = departementRepo.findAll();
		m.addAttribute("listeDepartements", deps);
		return "departements";
	}
	@GetMapping("/")
	public String index(Model m) {
		List<Departement> deps = departementRepo.findAll();
		m.addAttribute("listeDepartements", deps);
		return "departements";
	}
	@GetMapping("/ListeDepartementMateriel")
	public String getMateriel(Model m, @RequestParam(required = false,name="depId") String id) {
		Integer depId;
		try {
			depId = Integer.parseInt(id);
		} catch (Exception e) {
			return "internal_error";
		}
		Departement dep = departementRepo.findOne(depId);
		String nom = dep.getTitre();
		List<Materiel> mats = materielRepo.findAll();
		List<Materiel> output = new ArrayList<Materiel>();
		for(Materiel mat: mats) {
			if(mat.getDep() == depId) output.add(mat);
		}
		m.addAttribute("listeMateriel", output);
		m.addAttribute("nomDep", nom);
		return "ListeMaterielsDepartement";
	}
	@GetMapping("/removeMateriel")
	public String removeMateriel(Model m, @RequestParam(required = false,name="matId") String id) {
		Integer matId;
		try {
			matId = Integer.parseInt(id);
		} catch (Exception e) {
			return "Internal Error";
		}
		Materiel mat = materielRepo.findOne(matId);
		m.addAttribute("depId", mat.getDep());
		materielRepo.delete(mat);
		return "redirect:/ListeDepartementMateriel";
	}
	@GetMapping("/formMateriel")
	public String formMateriel(Model m, @RequestParam(required = false,name="depId") String id) {
		Integer depId;
		try {
			depId = Integer.parseInt(id);
		} catch (Exception e) {
			return "Internal Error";
		}
		m.addAttribute("depId", depId);
		return "AjouterMateriel";
	}
	@PostMapping("/AddMateriel")
	public String AddMateriel(Model m, HttpServletRequest req) {
		String titre = req.getParameter("titre");
		String type = req.getParameter("type");
		Long sn;
		boolean etat;
		int depId;
		int qte;
		try {
			sn = Long.parseLong(req.getParameter("sn"));
			etat = Boolean.parseBoolean(req.getParameter("etat"));
			depId = Integer.parseInt(req.getParameter("depId"));
			qte = Integer.parseInt(req.getParameter("qte"));
		} catch (Exception e) {
			return "internal_error";
		}
		Materiel mat = new Materiel(null, titre, type, sn, qte, etat, depId);
		materielRepo.save(mat);
		m.addAttribute("depId", depId);
		return "redirect:/ListeDepartementMateriel";
	}
}
