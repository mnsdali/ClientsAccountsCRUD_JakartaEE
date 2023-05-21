package tn.enis.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.EqualsAndHashCode.Include;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString(exclude = { "comptes" })

@Entity
@Table(name = "t_client")
public class Client implements Serializable /* Spec JEE */ {

	private static final long serialVersionUID = 1L;

	@Id // PK
	@Include
	private String cin;
	private String nom;
	private String prenom;
	private String adresse;
	// bidirectionnelle
	@OneToMany(mappedBy = "client", fetch = FetchType.EAGER)
	private List<Compte> comptes;

	public Client(String cin, String nom, String prenom, String adresse) {
		super();
		this.cin = cin;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		comptes = new ArrayList<Compte>();
	}

}
