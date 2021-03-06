package models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import com.avaje.ebean.Model;
import play.data.validation.Constraints.*;

@Entity
public class Produto extends Model{

	@Id
	@GeneratedValue
	private Long id;
	
	@Required
	private String nome;
	
	@Required
	@ManyToOne
	private Categoria categoria;
	
	@Required
	private double preco;
	
	@Required
	private String descricao; 
	
	
	private String foto;
	//private byte[] foto;
	
	@ManyToMany
	private List<Carrinho> carrinho = new ArrayList<>();
	
	@Required
	private Boolean disponivel;
	
	public static Finder<Long, Produto> find = new Finder<Long,Produto>(Produto.class);

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}


	public List<Carrinho> getCarrinho() {
		return carrinho;
	}

	public void setCarrinho(List<Carrinho> carrinho) {
		this.carrinho = carrinho;
	}

	public Boolean getDisponivel() {
		return disponivel;
	}

	public void setDisponivel(Boolean disponivel) {
		this.disponivel = disponivel;
	}
	
	

}
